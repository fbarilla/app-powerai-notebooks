FROM jarvice/ubuntu-ibm-mldl-ppc64le

RUN apt-get -y install unzip openssh-server && apt-get clean


# uprev to force rebuild even if cached
ENV APP_POWERAI_VERSION 6

ADD https://raw.githubusercontent.com/nimbix/notebook-common/master/install-ubuntu.sh /tmp/install-ubuntu.sh
RUN bash /tmp/install-ubuntu.sh && rm -f /tmp/install-ubuntu.sh

COPY NAE/screenshot.png /etc/NAE/screenshot.png
COPY NAE/help.html /etc/NAE/help.html

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
