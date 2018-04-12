Easy Open Corsair for H100i v2 on Linux
===============
Little script to speed up the configuration of AIO Corsair H100i v.2 using Open Corsair Link for Linux

### Running
Since Open Corsair Link needs direct hardware access you should run this script with 'sudo' or as root.
You have to execute the script on the folder where OCL was compiled or uncomment and edit the `cd` line.

### Dependencies
libusb-1.0

Install it with:
`sudo apt-get install libusb-1.0-0-dev`

### Additional info
To compile Open Corsair Link [download and extract the ZIP file](https://github.com/audiohacked/OpenCorsairLink) and execute this command on the folder where the extracted files are located:
`sudo make` 
