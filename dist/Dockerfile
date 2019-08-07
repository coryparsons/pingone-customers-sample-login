#FROM is the base image for which we will run our application
FROM nginx:latest
 
#COPY files & directories from the application
COPY index.html /usr/share/nginx/html
COPY favicon.ico /usr/share/nginx/html
COPY js/ /usr/share/nginx/html/js/
COPY css/ /usr/share/nginx/html/css/
COPY login/ /usr/share/nginx/html/login/
COPY logout/ /usr/share/nginx/html/logout/
 
#Tell Docker we are going to use this port
EXPOSE 80
