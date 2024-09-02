# Use the official Node.js image from the Docker Hub
FROM ubuntu:24.04

RUN apt-get update
# Install application dependencies
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master 
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip
# Expose the port your application will run on
EXPOSE 80
# Define the command to run your application
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]