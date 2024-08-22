# ----------------- BUILD STAGE -----------------
# Use a base image with Java 21 and Maven
FROM maven:3.9.8-amazoncorretto-21 as build

# Set the working directory
WORKDIR /app

# Copy the current directory into the container
COPY . .

RUN mvn clean install

RUN ls -l /app/target
# ----------------- DEPLOY STAGE -----------------
# Use a Tomcat 8.5.6 base image
FROM tomcat:10-jdk21

# Copy the war file from the build image
COPY --from=build /app/target/spring-core-mvc-1.0-SNAPSHOT.war /usr/local/tomcat/

# Install unzip utility and setup application
RUN apt-get update && \
    apt-get install -y unzip && \
    mkdir -p /usr/local/tomcat/webapps/spring-core-demo && \
    echo "Unzipping spring-core-demo.war to /usr/local/tomcat/webapps/spring-core-mvc-1.0-SNAPSHOT.war..." && \
    unzip /usr/local/tomcat/spring-core-mvc-1.0-SNAPSHOT.war -d /usr/local/tomcat/webapps/spring-core-demo && \
    echo "Listing contents of /usr/local/tomcat/webapps/spring-core-demo to verify extraction:" && \
    ls -l /usr/local/tomcat/webapps/spring-core-demo


# Install Python 3.11
# RUN yum install -y openssl-devel bzip2-devel libffi-devel
# RUN yum groupinstall -y "Development Tools"
# RUN yum install -y wget

# RUN wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0a4.tgz
# RUN tar -xzf Python-3.11.0a4.tgz

# WORKDIR Python-3.11.0a4

# RUN ./configure --enable-optimizations
# RUN make altinstall

# Install python
#RUN #apt-get update && \
#    apt-get install -y python3



# Copy configurations, libraries, binaries, and web applications from local to the container
#COPY docker/tomcat_config /usr/local/tomcat/conf
COPY docker/postgresql-42.7.3.jar /usr/local/tomcat/lib
#COPY docker/tomcat_bin /usr/local/tomcat/bin
# COPY docker/webapps /usr/local/tomcat/webapps


# Modify permissions
RUN find /usr/local/tomcat -type f -exec chmod 777 {} \;

# Set the working directory
WORKDIR /usr/local/tomcat

# Expose port 8080 for the application
EXPOSE 8080

# Command to run when the container starts
#CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
#CMD ["sh /usr/local/tomcat/bin/startup.sh"]
CMD ["catalina.sh", "run"]