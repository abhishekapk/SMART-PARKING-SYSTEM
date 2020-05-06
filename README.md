<h1 align="center">SMART-PARKING-SYSTEM   🚗</h1>
<br>
<p align="center">
  <a href="https://github.com/abhishekapk/SMART-PARKING-SYSTEM">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfaTiGrhKrZ__y70ByRq6I8cSW2m8EMRTGhlCGGP0KpXQQde5R&usqp=CAU" alt="Logo" width="auto" height="auto">
  </a></p>
<br>
<h2>📕 ABSTRACT</h2>
<p align="justify">Computerized systems being an integral part of the current era, an automated parking system is one of its most commonly used applications.  The aim of this model is to build up and implement an automatic parking system that will detect the parking space with the help of image processing technique of the parking lot as well as reduce the human power. The smart parking system will able to have fewer interaction of humans. In additions to that, it has parking guidance system that can demonstrate and guide user towards a parking space. With the problems of ever increasing urban traffic congestion and the ever increasing shortage of space, the parking lots need to be well-equipped with parking space detection. The proposed system helps in counting the number of parked vehicles and, identifying the number of spots available. The system detects cars through images instead of electronic sensors embedded on the floors. A camera is installed at a high and fixed position in the parking lot. An image of empty parking lot is taken as reference and then image of parking lot with cars is taken. Both the images are subtracted to find the numbers of parking slots available.
<br>
</p>
<h2>📜 INTRODUCTION</h2>
 <p align="justify">Nowadays, car has become a necessity; it is no more a luxury especially for the working people. People even purchase car on installments. When talking about metropolitan, then traffic jams have become quite common recently during large number of vehicles. Also, we cannot deny the existence of the cars in our daily life. Whenever we go out by car, we face problems to find an available parking space.  When driver enters a certain parking lot, the first thing that he does is to look for some sign which tells whether the parking lot is fully occupied, partly occupied or vacant. . He also does not know how many parking slots are there and where to find a parking division for his car. Some of the parking divisions may remain unoccupied even when the total occupancy is high. This causes ineffective use of parking divisions as well as traffics jams around the entrance of parking lot. Therefore, by offering drivers with relevant information about the parking lot while entering the parking lot becomes an important issue.  When driver enters a certain parking lot, the driver takes a long time just to find an available parking space. Counting Available Parking Space using Image Processing helps to solve the problem that the driver faces at low cost. The system uses image processing to detect the existence of the car and also provides information such as number of available parking space. The system captures image using CCTV cameras and processes the image to count the available parking space. The system basically is implement  to plan, analyze, design, development and testing. The development of this system will use techniques of image processing that will be implemented in each phase of the methodology. This system gives information about the number of available parking space. It will provide benefit to all the drivers when they enter the parking lot. The system uses image processing, since the whole area in the parking lot can be observed with relatively few cameras. Other than that, the system is compact and the cost is not high. The image of a parking lot is taken by a surveillance camera set at some height in the parking lot.  MATLAB is used as software platform in this project.
</p>
<br>
<h2>📃 PROPOSED MODEL AND METHODLOGY </h2>
<p align="justify"> The main flow of the framework is shown in the Fig-1. Videos are acquired from the top view of the parking arena with the help of a fixed camera. Video is segmented into frames. Then from each segment a key frame is extracted and further processing is applied on this key frame, to reduce the computational complexity.
</p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image1.jpg" alt="Block Diagram" width="auto" height="auto">
  </a></p>
<br>
<h4>1) System Initialization</h4>
<p align="justify"><img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image2.jpg" alt="Background Image" width="250px" height="100px" align="right">In the initial stage, an image is captured by steady CCTV camera at time of installation which is the background reference image. This reference image does not contain any cars. The main purpose is to identify the parking slots in the image. The camera which is used to take the images is fixed at a certain position and it faces a fixed direction all the time.
</p>
<br>
<h4>2) Image Acquisition</h4>
<p align="justify"><img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image3.jpg" alt="Parking Image" width="250px" height="100px" align="right">In this step, the picture of parking space containing cars is taken with the help of a high-definition camera. <br>
The image frame containing six lane image is divided lane-wise.<br>
The image data is then supplied to the MATLAB software for further processing.
</p>
<br>
<h4>3) Thresholding of Image</h4>
<p align="justify">The RGB image acquired is then converted to gray-scale image and then binary image is created in the Image segmentation module. The equation used for the conversion to gray-scale image is <br>
Gray= 0.229R+0.587G+0.11B<br>
The gray scale image of the parking space with cars. From the resulting gray-scale image, binary image is obtained using thresholding technique. The binary image contains all the information about the position and shape of interest. The threshold level is set in such a way that the objects of interest are made into white and the rest of the image black.
</p>
<br>
<h4>4) Image Enhancement </h4>
<p align="justify">The binary image contains a lot of noise which is removed using morphological operations and filters such as the Weiner filter. The holes are removed with the help of imfill and bwareaopen  function.
</p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image4.jpg" alt="Image Enhancement" width="auto" height="auto">
  </a></p>
<br>
<h4>5) Image Detection</h4>
<p align="justify">In order to detect the cars, blob analysis is done using predefined functions in MATLAB and the number of cars is counted.
</p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image5.jpg" alt="Image Detection" width="auto" height="auto">
  </a></p>
<br>
<h2>📄 ALGORITHM OF THE PROPOSED SYSTEM</h2>
<p align="justify">The main steps of the proposed algorithm for parking space detection are:
  <br></p>
  <ol>
  <li>The system will get live stream video of the parking lot from camera.</li>
  <li>Images are captured when a car enters the parking lot.</li>
  <li>RGB Images are converted to binary images.</li>
  <li>The frame is cropped lane wise and considered sequentially and individually in a loop.</li>
  <li>Vacant slots with their respective lane is known by calculating the number of cars.</li>
  <li>And then it provide proper navigation to the vehicle.</li>
  </ol>

<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image6.jpg" alt="Algorithm" width="auto" height="auto">
  </a></p>
<br>
<h2>📑 CONCLUSION</h2>
<p align="justify">There are many automated car parking systems already available using technologies such as GSM, wireless transmitter, etc. This project was especially chosen for the purpose of learning more about image processing, as it is one of the most relevant technologies of our times and used in numerous other applications.
The parking space detection system based on image processing in MATLAB was designed and tested. It is possible to manage large area by just using several CCTV. It is consistent in detecting incoming cars because it uses actual car images. It is cheap and easy-installed because of the simple equipment. Drivers can get useful real-time parking lot information from this system by the guidance information display. Future researchers can focus on allocation  specific location  to customers  already  registered from online parking management system.
  </p>
<br>
<h2>📸 SCREENSHOT</h2>
<p align="justify">Command window of MATLAB after the execution of code.
  </p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image7.jpg" alt="MATLAB output" width="auto" height="auto">
  </a></p>
<br>
<p align="justify">Two output figures are there after the execution of code.<br>
Figure 1 – Observation of the Whole parking area .<br>
Figure 2 – Observation of the each lane in parking area and the vacant lane is shown.
  </p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image8.jpg" alt="Figure 1" width="auto" height="auto">
  </a></p>
<br>
<p align="center">
  <a href="">
    <img src="https://raw.githubusercontent.com/abhishekapk/SMART-PARKING-SYSTEM/master/Images/image9.jpg" alt="Figure 2" width="auto" height="auto">
  </a></p>
<br>
<h2>📜 LICENSE</h2>

[MIT](https://github.com/abhishekapk/SMART-PARKING-SYSTEM/blob/master/LICENSE)
