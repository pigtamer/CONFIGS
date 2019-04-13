apt update

apt install python3 python3-pip git vim axel tree zip

# Prerequisites for opencv-python.
apt install libsm6 libxext6 libxrender1 libfontconfig1

# opencv
pip3 install opencv-python numpy matplotlib jupyter

# mxnet for cuda
pip3 install mxnet-cu100==1.5.0b20181222

# Download Cuda v10.0 Installer for Linux Ubuntu 16.04 x86_64
axel -a -n 16 "https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run"

# Download cuDNN v7.5.0 (Feb 21, 2019), for CUDA 10.0
axel -a -n 16 "https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.5.0.56/prod/10.0_20190219/cudnn-10.0-linux-x64-v7.5.0.56.tgz"

#
apt install ubuntu-desktop
