# FROM python:3.12-slim-bullseye
# FROM node:20.9-bullseye-slim
FROM nikolaik/python-nodejs:python3.8-nodejs18-slim

ENV TZ=Asia/Taipei
ENV PYTHONPATH=/workspaces/screeps-editor/screeps_console/screeps_console

# Set timezome to CST
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Development tools
RUN apt-get update && \
    apt-get clean && \
    apt-get install git zsh vim curl make -y
RUN echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 
# RUN git clone -b build https://github.com/screepers/screeps_console.git
RUN git clone -b build https://github.com/tiennou/screeps_console.git
