%PROGRAM FOR SMART PARKING SYSYTEM
%made by - 
%ABHISHEK KUMAR GUPTA  ITGGV BILASPUR
%SHIVANGI VARSHNEY     JIIT NOIDA
%SHREYA SINGH          MMMUT GORAKHPUR
% ASHISH SINGH         AIT KANPUR

image = imread('C:\Users\hp\Documents\MATLAB\car.jpg'); %To read Cars parked in parking area.
background = imread('C:\Users\hp\Documents\MATLAB\bg.jpg'); %To read background image or initial image of parking area
img = double(rgb2gray(image));%convert to gray
bg = double(rgb2gray(background));%convert 2nd image to gray
[height width] = size(img); %image size?
%ITS WORK FOR WHOLE PARKING SYSTEM
totalslot=36;    %Given Total number of slot in the parking area.
 %Foreground Detection
 thresh=11;
 fr_diff = abs(img-bg);
 for j = 1:width
 for k = 1:height
 if (fr_diff(k,j)>thresh)
 fg(k,j) = img(k,j);
 else
 fg(k,j) = 0;
 end
 end
 end
 park=sprintf('(Orignal Frame) Parking Area with %d slot',totalslot);
 subplot(2,2,1) , imshow(image), title (park);
 subplot(2,2,2) , imshow(mat2gray(img)), title ('converted Frame');
 subplot(2,2,3) , imshow(mat2gray(bg)), title ('BACKGND Frame ');
 
 sd=imadjust(fg);% adjust the image intensity values to the color map
 level=graythresh(sd);
 m=imnoise(sd,'gaussian',0,0.025);% apply Gaussian noise
 k=wiener2(m,[5,5]);%filtering using Weiner filter
 bw=im2bw(k,level);
 bw2=imfill(bw,'holes');
 bw3 = bwareaopen(bw2,5000);
 labeled = bwlabel(bw3,8);
 %Blob measurements 
 blobMeasurements = regionprops(labeled,'all');
numberofcars = size(blobMeasurements, 1);
cars=sprintf('[FOREGROUND] , Total space available is %d',totalslot-numberofcars);
 subplot(2,2,4) , imagesc(labeled), title (cars);
 hold off;

 %CONDITION TO CHECK THE VACANT SPACE
 %IF YES then it divide it itno 6 parts as 6 LANEs are there then for each
 %lane image processing is applied as before and lane with vacant space
 %comes first with their space.
 %LANE number are like  
 %           LANE 1       LANE 2
 %           LANE 3       LANE 4
 %           LANE 5       LANE 6
 
 if((totalslot-numberofcars)>0);
     fprintf('You can enter into the parking area');
     fprintf('\n Number of car present');
    disp(numberofcars);% display number of cars
     fprintf('Number of vacant space present present');
    disp(totalslot-numberofcars);
    fprintf('PARKING AREA STRUCTURE with LANE:- \n LANE 1\t\t LANE 2 ');
    fprintf('\n LANE 3\t\t LANE4 \n LANE 5\t\t LANE 6');
%These code just divide the image of full parking area into 6 parts as 3
%rows and 2 coloums.
  r3=int32(height/3);
    c2=int32(width/2);
    img1=img(1:r3,1:c2);
    img2=img(1:r3,c2+1:end);
    img3=img(1+r3:2*r3,1:c2);
    img4=img(1+r3:2*r3,c2+1:end);
    img5=img(2*r3+1:end,1:c2);
    img6=img(2*r3+1:end,c2+1:end);
    imga={img1 img2 img3 img4 img5 img6};   %An Array iscreated which store 6 image.
    bg1=bg(1:r3,1:c2);
    bg2=bg(1:r3,c2+1:end);
    bg3=bg(1+r3:2*r3,1:c2);
    bg4=bg(1+r3:2*r3,c2+1:end);
    bg5=bg(2*r3+1:end,1:c2);
    bg6=bg(2*r3+1:end,c2+1:end);
    bga={bg1 bg2 bg3 bg4 bg5 bg6};
    
    % LOOP is taken from LANE 6 to LANE 1 for better understandibilty.
    % And again previos process is taken for each lane for vacant space
    % detection.
    for a=6:-1:1
     totalslota=6;     %Also all variables are changed by adding a as suffix.
        imgb=imga{a};
        
        bgb=bga{a};
        [heighta widtha] = size(imgb);
        thresha=11;
 fr_diffa = abs(imgb-bgb);
 for j = 1:widtha
 for k = 1:heighta
 if (fr_diffa(k,j)>thresha)
 fga(k,j) = imgb(k,j);
 else
 fga(k,j) = 0;
 end
 end
 end
 
 sda=imadjust(fga);% adjust the image intensity values to the color map
 levela=graythresh(sda);
 ma=imnoise(sda,'gaussian',0,0.025);% apply Gaussian noise
 ka=wiener2(ma,[5,5]);%filtering using Weiner filter
 bwa=im2bw(ka,level);
 bw2a=imfill(bwa,'holes');
 bw3a = bwareaopen(bw2a,5000);
 labeleda = bwlabel(bw3a,8);
 
 blobMeasurementsa = regionprops(labeleda,'all');
numberofcarsa = size(blobMeasurementsa, 1);
 %If lane is available with vacant slot then this statement is true and car will get its direction. 
 if((totalslota-numberofcarsa)>0)
     fprintf('\n \nGo to Lane %d',a);
 fprintf('\n Number of car present');
    disp(numberofcarsa);% display number of cars
     fprintf('Number of vacant space present present');
    disp(totalslota-numberofcarsa);
    figure, subplot(2,2,1), imshow(image), title('Whole parking area');
    lane=sprintf('Lane %d is availabe with vacant slot',a);
    subplot(2,2,2) , imshow(mat2gray(imgb)), title (lane);
 subplot(2,2,3) , imshow(mat2gray(bgb)), title ('BACKGND Frame ');
 cars=sprintf('[FOREGROUND] , Total space available in lane %d is %d',a,totalslota-numberofcarsa);
 subplot(2,2,4) , imagesc(labeleda), title (cars);
 hold off;
 break;
 end
 
    end
    else
     fprintf('\n No space available in parking area.\n Exit');
     % If whole parking area is full then this statement will execute.
 end

      
     
 