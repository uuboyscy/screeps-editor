FROM nikolaik/python-nodejs:python3.11-nodejs18-slim

ENV TZ=Asia/Taipei
ENV PYTHONPATH=/workspaces/screeps-editor/screeps_console/screeps_console

# Set timezome to CST
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Development tools
RUN apt-get update && \
    apt-get clean && \
    apt-get install git zsh vim curl make -y
RUN echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install local console
# RUN git clone -b build https://github.com/screepers/screeps_console.git
RUN git clone https://github.com/uuboyscy/screeps_console.git
RUN npm install -g screeps-multimeter
