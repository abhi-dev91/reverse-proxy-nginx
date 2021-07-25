FROM centos
RUN yum install nginx git cronie -y
RUN rm -rf /etc/nginx
RUN git -C /etc/ clone https://github.com/abhi-dev91/nginx.git
RUN echo 00 * * * * logrotate /etc/nginx/logs/logrotate.conf > crontab1
RUN crontab crontab1
CMD /sbin/nginx
CMD ["nginx", "-g", "daemon off;"]
