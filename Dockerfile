FROM python:3.8-slim-buster

ENV CHROMEVERSION=google-chrome-stable
ENV CHROMEDRIVERVERSION=80.0.3987.106
ENV TESTDIR=/tests/

RUN apt-get update -y \
    && apt-get install -y wget \
    && apt-get install -y curl \
    && apt-get install -y gnupg \
    && apt-get install -y unzip zip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update -y
RUN apt-get install -y $CHROMEVERSION

RUN wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/
RUN apt-get install -y xvfb

RUN pip3 install robotframework && \ 
    pip3 install robotframework-seleniumlibrary

RUN mkdir $TESTDIR

COPY /run.sh /run.sh


CMD ["/run.sh"]