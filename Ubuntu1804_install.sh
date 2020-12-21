read -s -p "Please input the password for sudo command: " password
path_project=${PWD}
echo $password | sudo -k -S apt-get update

#########################
#PkgConfig install
#########################
echo $password | sudo -k -S apt-get install pkg-config

#########################
#boost install
#########################
echo $password | sudo -k -S apt-get install libboost-all-dev

#########################
#jsoncpp install
#########################
echo $password | sudo -k -S apt-get install libjsoncpp-dev
echo $password | sudo -k -S cp -r /usr/include/jsoncpp/json /usr/include

#########################
#ZeroMQ install
#########################
echo $password | sudo -k -S apt-get install wget git
wget https://github.com/zeromq/libzmq/releases/download/v4.3.2/zeromq-4.3.2.zip
unzip zeromq-4.3.2.zip
cd zeromq-4.3.2
echo $password | sudo -k -S apt-get install autoconf autogen
./autogen.sh
./configure --prefix=${PWD}/../libzmq
make
make install
git clone https://github.com/zeromq/cppzmq
cp cppzmq/zmq.hpp ${PWD}/../libzmq/include
cp cppzmq/zmq_addon.hpp ${PWD}/../libzmq/include
linzmq_path=${PWD}/../libzmq

######################################
#opencv,opencv_contrib install
######################################
cd ${path_project}
echo $password | sudo -k -S apt-get install build-essential
echo $password | sudo -k -S apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
echo $password | sudo -k -S apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
unzip opencv-3.4.5.zip
unzip opencv_contrib-3.4.5.zip
cd opencv-3.4.5
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.5/modules ..
make
echo $password | sudo -k -S make install

#########################
#pcl install
#########################
echo $password | sudo -k -S add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
echo $password | sudo -k -S apt-get update
echo $password | sudo -k -S apt-get install libpcl-dev
echo $password | sudo -k -S cp -r /usr/include/pcl-1.8/pcl /usr/include

#########################
#eigen3 install
#########################
echo $password | sudo -k -S apt-get install libeigen3-dev
echo "zmq install path:${linzmq_path}"
cd ${path_project}