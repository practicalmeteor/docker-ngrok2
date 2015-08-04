FROM phusion/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

ADD https://launchpadlibrarian.net/139763816/unzip_6.0-9ubuntu1_amd64.deb /unzip.deb
RUN dpkg -i /unzip.deb && rm -f /unzip.deb

ADD https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip /ngrok.zip
RUN unzip -o ngrok.zip -d /bin && false || rm -f ngrok.zip

RUN mkdir /etc/service/ngrok
ADD ./ngrok_run.sh /etc/service/ngrok/run
RUN chmod +x /etc/service/ngrok/run

RUN groupadd -r ngrok && useradd -rm -g ngrok ngrok
WORKDIR /home/ngrok

ADD ngrok.yml /home/ngrok/.ngrok2/

EXPOSE 4040


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

