FROM ubuntu:18.04
MAINTAINER "Instamojo" <pick2amit@gmail.com>

LABEL name="Docker build to execute the automation script script for https://staging.instamojo.com"

RUN mkdir -p /usr/src/project
WORKDIR /usr/src/project


COPY . /usr/src/project

RUN apt-get update && apt -y upgrade
RUN apt install -y python3-pip
RUN apt install -y wget
RUN apt-get install unzip
RUN apt-get install -y xvfb

# install robotframework with seleniumlibrary
RUN python3 -m pip install robotframework-seleniumlibrary
# For file support of xls or xlsx file, need to install the extra XLS with datadriver Library
RUN pip3 install --upgrade robotframework-datadriver[XLS]


# download unzip & store chromedriver v-84 in bin folder
RUN wget -N http://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip -d /bin
#can remove the zip file here
RUN chmod +x /bin/chromedriver
# Install the datadriver to read/write the xls & xlsx file
RUN pip3 install --upgrade robotframework-datadriver[XLS]


# download & install chrome browser latest version (v-84)
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb




CMD ["sh", "run.sh"]

#Requirement to run this project
# chromedriver version: 84.0.4147.30
# chrome version: 84
# pythone version: 3.6.8
# Robotframework version: latest
# Seleniumlibrary: latest