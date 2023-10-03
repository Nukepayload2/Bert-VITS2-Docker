# syntax=docker/dockerfile:1
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# region=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# apt use tsinghua source
RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

# install python 3.8 and other deps
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install python3.8 -y
RUN apt install python3-pip -y
RUN apt install ffmpeg -y

# restore packages
WORKDIR /app

## pip use tsinghua source
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

## install packages
### install torch first
RUN pip install https://mirrors.aliyun.com/pytorch-wheels/cu118/torch-2.0.1+cu118-cp38-cp38-linux_x86_64.whl
RUN pip install https://mirrors.aliyun.com/pytorch-wheels/cu118/torchaudio-2.0.2+cu118-cp38-cp38-linux_x86_64.whl
RUN pip install https://mirrors.aliyun.com/pytorch-wheels/cu118/torchvision-0.15.2+cu118-cp38-cp38-linux_x86_64.whl
### install others
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy code
COPY . .

# exports
EXPOSE 6006/tcp
EXPOSE 7860/tcp
ENTRYPOINT ["./メニュー.sh"]
