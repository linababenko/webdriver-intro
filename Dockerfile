#FROM ubuntu:20.04
#MAINTAINER linababenko
#
#RUN apt-get update && apt-get install -y curl
##====================================
## The wget command is a command line utility for downloading files from the Internet:
##====================================
#RUN apt-get install -y wget
#
##==============
## Install Java:
##==============
#RUN apt-get install openjdk-8-jdk -y
#RUN java -version
#RUN update-alternatives --list java
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
#    PATH=$PATH:$JAVA_HOME/bin
#
###==========================
### Install nodejs on Ubuntu:
###==========================
##RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
##RUN apt-get install nodejs
##RUN node -v
##RUN npm -v
##
###=============
### Create user:
###=============
##RUN useradd -m -s /bin/bash automator
##USER automator
##
###=======================
### Install Appium server:
###=======================
##ARG APPIUM_VERSION=1.18.1
##ENV APPIUM_VERSION=$APPIUM_VERSION
##RUN npm install -g appium@${APPIUM_VERSION} --unsafe-perm=true --allow-root
##RUN exit 0
#
#
##RUN npm install -g appium@${APPIUM_VERSION} --unsafe-perm=true --allow-root
##RUN mkdir /opt/appium \
##  && cd /opt/appium \
##  && npm install appium@$APPIUM_VERSION \
##  && ln -s /opt/appium/node_modules/.bin/appium /usr/bin/appium
##===============
## 4723
##   Appium port
##===============
##EXPOSE 4723
##RUN appium -v
##RUN mkdir /home/automator/appium
##ENV HOME /home/automator/appium
##RUN cd /home/automator/appium && npm install appium &&
##RUN appium --version
##RUN npm install -y appium-doctor -g && appium-doctor
##
###===============
### Main Android SDK in user dir
###===============
##RUN wget -qO- "http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz" | tar -zxv -C /home/automator
###RUN echo y | /home/automator/android-sdk-linux/tools/android update sdk --no-ui --all --filter platform-tools,build-tools-19.1.0,system-image,android-19,extra-android-support --force
##ENV ANDROID_HOME /home/automator/android-sdk-linux
##ENV PATH /home/automator/android-sdk-linux/platform-tools:/home/automator/android-sdk-linux/tools:$PATH
###ENV ANDROID_SDK_HOME /home/automator/.android
####RUN echo "no" | /home/automator/android-sdk-linux/tools/android create avd --force -name "TEST" -k "system-images;android-25;google_apis;x86"
###RUN echo "no" | avdmanager --verbose create avd --force --name "pixel_8.1" --device "pixel" --package "system-images;android-27;google_apis;x86" --tag "google_apis" --abi "x86"
##
#
##=============
## Android SDK
##=============
#ENV ANDROID_SDK_VERSION 24.4.1
#ENV ANDROID_HOME /opt/android-sdk-linux
#ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
#RUN cd /opt \
#  && wget --no-verbose http://dl.google.com/android/android-sdk_r$ANDROID_SDK_VERSION-linux.tgz -O android-sdk.tgz \
#  && tar xzf android-sdk.tgz \
#  && rm -f android-sdk.tgz \
#  && cd android-sdk-linux/tools \
#  && mv -f emulator64-arm emulator \
#  && rm -f emulator64* emulator-* \
#  && chmod +x android emulator
#
##=====================
## Android SDK Manager
##=====================
#ENV ANDROID_COMPONENTS platform-tools,build-tools-25.0.3
#RUN echo y | android update sdk --all --force --no-ui --filter ${ANDROID_COMPONENTS}
#
##===================
## Nodejs and Appium
##===================
#ENV APPIUM_VERSION 1.18.1
#RUN apt-get update -qqy \
#  && apt-get -qqy --no-install-recommends install \
#    nodejs \
#    npm \
#  && ln -s /usr/bin/nodejs /usr/bin/node \
#  && npm install -g appium@$APPIUM_VERSION \
#  && npm cache clean \
#  && apt-get remove --purge -y npm \
#  && apt-get autoremove --purge -y \
#  && rm -rf /var/lib/apt/lists/*
#
###============================================
### Add udev rules file with USB configuration
###============================================
##ENV UDEV_REMOTE_FILE https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
##RUN mkdir /etc/udev/rules.d \
##  && wget --no-verbose $UDEV_REMOTE_FILE -O /etc/udev/rules.d/51-android.rules
#
## Appium server port
#EXPOSE 4723
#
#CMD appium
