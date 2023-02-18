curl -o cudnn.tar.xz https://developer.download.nvidia.com/compute/cudnn/secure/8.4.1/local_installers/11.6/cudnn-linux-x86_64-8.4.1.50_cuda11.6-archive.tar.xz?$1
mkdir cudnn
tar -xvf cudnn.tar.xz -C cudnn --strip-components 1
sudo cp cudnn/include/cudnn*.h /usr/local/cuda-11.6/include
sudo cp -P cudnn/lib/libcudnn* /usr/local/cuda-11.6/lib64
sudo chmod a+r /usr/local/cuda-11.6/include/cudnn*.h /usr/local/cuda-11.6/lib64/libcudnn*
cat /usr/local/cuda-11.6/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
