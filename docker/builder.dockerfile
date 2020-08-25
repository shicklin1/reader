FROM thyrlian/android-sdk:latest

RUN apt-get update
RUN apt-get install wget bash curl file git unzip xz-utils zip libglu1-mesa snap -y

#install flutter
RUN wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.20.2-stable.tar.xz -O ~/flutter_linux_1.20.2-stable.tar.xz 
RUN ls -halt
RUN mkdir ~/development
RUN cd ~/development && tar xf ~/flutter_linux_1.20.2-stable.tar.xz

ENV PATH="$PATH:`/root/development/flutter/bin"
RUN echo $PATH
RUN ls -halt /root/development/flutter/bin
RUN /root/development/flutter/bin/flutter precache
RUN /root/development/flutter/bin/flutter doctor -v
