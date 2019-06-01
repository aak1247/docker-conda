FROM ubuntu:18.04

MAINTAINER aak1247 < aak1247@126.com >
LABEL maintainer="aak1247@126.com"

RUN rm -rf /var/lib/apt/lists/*
ADD resources/sources.list /etc/apt/
ADD resources/pip.conf /root/.pip/
RUN apt-get clean && apt-get -y update --fix-missing
RUN apt-get update && apt-get install -y python3 python3-pip wget
RUN wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O /home/anaconda.sh
RUN bash /home/anaconda.sh -b -p /home/anaconda 
ENV PATH /home/anaconda/bin:$PATH
# use `source /home/anaconda/bin/activate` to activete env
ADD resources/requirements.txt /home/
ADD resources/environment.yml /home/

ENV PYTHON_VERSION 3.6

RUN /home/anaconda/bin/conda create -f /home/environment.yml
RUN /bin/bash -c "source activate conda && pip install -r /home/requirements.txt"
RUN conda install tensorflow-gpu=1.13
ADD app.py /home/
CMD /bin/bash -c "source activate conda" && python /home/app.py
