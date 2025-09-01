FROM amazonlinux:latest

# Install necessary packages
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
# Set working directory
WORKDIR /tmp

# Download and extract the template from GitHub
RUN wget https://github.com/StartBootstrap/startbootstrap-freelancer/archive/refs/heads/master.zip -O site.zip && \
    unzip site.zip && \
    cp -r startbootstrap-freelancer-master/* /var/www/html/ && \
    rm -rf site.zip startbootstrap-freelancer-master

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

