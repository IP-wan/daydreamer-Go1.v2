FROM nvcr.io/nvidia/cuda:12.0.0-cudnn8-runtime-ubuntu22.04
LABEL authors="ipwan"


ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git python3.10 python3-pip dbus-x11 terminator ffmpeg
RUN pip install tensorflow==2.15 tensorflow-probability==0.22.0 attr attrs cloudpickle dm-sonnet filterpy gym==0.22.0 pybullet pygame rich ruamel.yaml zmq numpy==1.24.0

WORKDIR home/
RUN git clone https://github.com/IP-wan/daydreamer-Go1.v2.git
WORKDIR daydreamer-Go1.v2/

