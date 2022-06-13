FROM ubuntu:18.04
LABEL maintainer="damaaf" email="damaaf@gmail.com"
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
#ADD static-website-example/ /var/www/html/
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/damaaf/static-website-jenkins.git /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
#CMD gunicorn --bind 0.0.0.0:$PORT wsgi
