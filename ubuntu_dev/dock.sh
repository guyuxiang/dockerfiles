##!/bin/bash
# sudo xhost +
# docker run --rm -it --shm-size=1gb -v c:/Users/yuxia/docker_ubuntu_dev:/home/devg:cached $(docker build -q .)
docker run --rm -it --shm-size=1gb -v c:/Users/yuxia/docker_ubuntu_dev:/home/devg:cached yuxianggu/ubuntu_dev:latest