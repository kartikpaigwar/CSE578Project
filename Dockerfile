FROM ubuntu:20.04
LABEL maintainer="k.kartikpaigwar@gmail.com"
LABEL version="0.1"

# add new sudo user
ENV USERNAME CSE578
ENV HOME /home/$USERNAME
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        mkdir /etc/sudoers.d && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME


# install package
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        software-properties-common \
        curl \
        wget \
	    tmux \
	    htop \
	    nano \
        sudo \
        less \
        emacs \
	    zip \
	    unzip \
	    make \
	    gcc-8 \
	    g++-8 \
        apt-utils\
	    && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get install -y python3.9 python3-pip
#RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN python -m pip install --upgrade pip
ENV PIP_NO_CACHE_DIR=off

WORKDIR $HOME
COPY . .
RUN pip install -r requirements.txt
RUN chmod -R 777 .