#  Docker Project #

A small clone of 1024, based on Saming's 2048 (also a clone).
Made just for fun.


## Create a folder 
 * mkdir 2048-game
 * cd 2048-game 

## Create a Docker File 
* vi Dockerfile

* Use the official Node.js image from the Docker Hub
FROM ubuntu:24.04
RUN apt-get update
* Install application dependencies
RUN apt-get install -y nginx zip curl
RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master 
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip
* Expose the port your application will run on
EXPOSE 80
* Define the command to run your application
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

## Docker commands

Build a docker image with help of docker file 

## docker build -t 2048-game:v1 . 

Run the docker image as docker container
## docker run -d -p 80:80 2048-game:v1

## localhost:80