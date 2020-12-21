Step1:环境搭建
    
    配置ubuntu16.04操作系统的环境，在SDK文件夹终端，使用命令::

        source Ubuntu1604_install.sh

    配置ubuntu18.04操作系统的环境，在SDK文件夹终端，使用命令::

        source Ubuntu1804_install.sh

Step2:样例运行

    修改 mecheye_cpp_interface-1.0.0/CMakeLists.txt 文件:

        使用Step1的输出信息的最后一行"zmq install path: "后面的路径替换CMakeLists.txt 文件中的"<libzmq folder path>"（第27行 和 第44行）

    修改 mecheye_cpp_interface-1.0.0/src/sample2_ImgAndCloud.cpp 文件以保证可以根据正确的相机IP地址连接到相机:
    
        参考 mecheye_cpp_interface-1.0.0/img/ip.jpg 修改cameraIp

    样例运行，在SDK文件夹终端，使用命令::
    
        source run_sample.sh