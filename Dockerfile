FROM python:3.8-slim-buster

ENV CHROMEVERSION=google-chrome-stable
ENV CHROMEDRIVERVERSION=80.0.3987.106
ENV TESTDIR=
ENV THREADS=0
ENV ROBOTARGS=

#=========
# Chrome
#=========
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

#=========
# Chromedriver
#=========
RUN wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/
RUN apt-get install -y xvfb

#=========
# Firefox
#=========
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    # Firefox dependencies:
    libgtk-3-0 \
    libdbus-glib-1-2 \
    bzip2 \
  && DL='https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64' \
  && curl -sL "$DL" | tar -xj -C /opt \
  && ln -s /opt/firefox/firefox /usr/local/bin/ \
  # Remove obsolete files:
  && apt-get autoremove --purge -y \
    bzip2 \
  && apt-get clean \
  && rm -rf \
    /tmp/* \
    /usr/share/doc/* \
    /var/cache/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
#=========
# Geckodriver
#=========
RUN BASE_URL=https://github.com/mozilla/geckodriver/releases/download \
  && VERSION=$(curl -sL \
    https://api.github.com/repos/mozilla/geckodriver/releases/latest | \
    grep tag_name | cut -d '"' -f 4) \
  && curl -sL "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" | \
    tar -xz -C /usr/local/bin

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY /bin/run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
