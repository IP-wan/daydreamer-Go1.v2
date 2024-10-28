FROM nvcr.io/nvidia/cuda:12.2.2-cudnn8-runtime-ubuntu22.04
LABEL authors="ipwan"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3.10 python3-pip dbus-x11 terminator
RUN pip install tensorflow==2.15 tensorflow-probability==0.22.0 attr attrs cloudpickle dm-sonnet filterpy gym==0.22.0 pybullet pygame rich ruamel.yaml zmq numpy==1.24.0

WORKDIR /mnt

