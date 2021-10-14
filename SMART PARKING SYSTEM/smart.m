currentPose = [4 12 0]; % [x, y, theta]
vehicleSim.setVehiclePose(currentPose);

% Reset velocity.
currentVel  = 0; % meters/second
vehicleSim.setVehicleVelocity(currentVel);

while ~reachedDestination(behavioralPlanner)

    % Request next maneuver from behavioral layer.
    [nextGoal, plannerConfig, speedConfig] = requestManeuver(behavioralPlanner, ...
        currentPose, currentVel);

    % Configure the motion planner.
    configurePlanner(motionPlanner, plannerConfig);

    % Plan a reference path using RRT* planner to the next goal pose.
    refPath = plan(motionPlanner, currentPose, nextGoal);

    % Check if the path is valid. If the planner fails to compute a path,
    % or the path is not collision-free because of updates to the map, the
    % system needs to re-plan. This scenario uses a static map, so the path
    % will always be collision-free.
    isReplanNeeded = ~checkPathValidity(refPath, costmap);
    if isReplanNeeded
        warning('Unable to find a valid path. Attempting to re-plan.')

        % Request behavioral planner to re-plan
        replanNeeded(behavioralPlanner);
        continue;
    end

    % Retrieve transition poses and directions from the planned path.
    [transitionPoses, directions] = interpolate(refPath);

    % Smooth the path.
    numSmoothPoses   = round(refPath.Length / approxSeparation);
    [refPoses, directions, cumLengths, curvatures] = smoothPathSpline(transitionPoses, directions, numSmoothPoses);

    % Generate a velocity profile.
    refVelocities = helperGenerateVelocityProfile(directions, cumLengths, curvatures, startSpeed, endSpeed, maxSpeed);

    % Configure path analyzer.
    pathAnalyzer.RefPoses     = refPoses;
    pathAnalyzer.Directions   = directions;
    pathAnalyzer.VelocityProfile = refVelocities;

    % Reset longitudinal controller.
    reset(lonController);

    reachGoal = false;

    % Execute control loop.
    while ~reachGoal
        % Find the reference pose on the path and the corresponding
        % velocity.
        [refPose, refVel, direction] = pathAnalyzer(currentPose, currentVel);

        % Update driving direction for the simulator.
        updateDrivingDirection(vehicleSim, direction);

        % Compute steering command.
        steeringAngle = lateralControllerStanley(refPose, currentPose, currentVel, ...
            'Direction', direction, 'Wheelbase', vehicleDims.Wheelbase);

        % Compute acceleration and deceleration commands.
        lonController.Direction = direction;
        [accelCmd, decelCmd] = lonController(refVel, currentVel);

        % Simulate the vehicle using the controller outputs.
        drive(vehicleSim, accelCmd, decelCmd, steeringAngle);

        % Check if the vehicle reaches the goal.
        reachGoal = helperGoalChecker(nextGoal, currentPose, currentVel, speedConfig.EndSpeed, direction);

        % Wait for fixed-rate execution.
        waitfor(controlRate);

        % Get current pose and velocity of the vehicle.
        currentPose  = getVehiclePose(vehicleSim);
        currentVel   = getVehicleVelocity(vehicleSim);
    end
end

% Show vehicle simulation figure.
showFigure(vehicleSim);