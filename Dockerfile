FROM amazonlinux:latest

# Install necessary packages
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
# Set working directory
WORKDIR /tmp

# Download and extract the template from GitHub
RUN wget https://github.com/kimkyeongkil/templatemo_591_villa_agency/archive/refs/heads/main.zip && \
    unzip main.zip && \
    cp -r templatemo_591_villa_agency-main/* /var/www/html/ && \
    rm -rf main.zip templatemo_591_villa_agency-main

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

