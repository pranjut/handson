echo '###################################Basic setup###################################'
sudo apt-get update
echo 'Y\n'| sudo apt-get install ipython
echo 'Y\n'| sudo apt-get install python3-pip
sudo pip3 install jupyter
#sudo jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
pip3 install --user numpy scipy matplotlib ipython jupyter pandas sympy nose

### Time to upload the cudnn file

echo '###################################Download and setup cudnn###################################'
curl https://s3.us-east-2.amazonaws.com/sojars/testupload/cudnn-8.0-linux-x64-v5.1.tgz --output cudnn-8.0-linux-x64-v5.1.tgz
tar -zxvf cudnn-8.0-linux-x64-v5.1.tgz 
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

echo '###################################Path setup in bashrc###################################'
#  source ~/.bashrc 
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda-9.0/lib64"' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc

source ~/.bashrc

#echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
#curl https://bazel.build/bazel-release.pub... | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install bazel

echo '###################################Install tensorflow gpu###################################'
sudo pip3 install tensorflow-gpu

echo '###################################Add NVIDIA package repository###################################'
# Add NVIDIA package repository
#sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
#wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
#sudo apt install ./cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
sudo apt update

echo '###################################Install CUDA and tools. Include optional NCCL 2.x###################################'
# Install CUDA and tools. Include optional NCCL 2.x
sudo apt install cuda9.0 cuda-cublas-9-0 cuda-cufft-9-0 cuda-curand-9-0 \
    cuda-cusolver-9-0 cuda-cusparse-9-0 libcudnn7=7.2.1.38-1+cuda9.0 \
    libnccl2=2.2.13-1+cuda9.0 cuda-command-line-tools-9-0

echo '###################################Optional: Install the TensorRT runtime (must be after CUDA install)###################################'
# Optional: Install the TensorRT runtime (must be after CUDA install)
sudo apt update
sudo apt install libnvinfer4=4.1.2-1+cuda9.0
