FROM maven:3.6.0-jdk-13

#RUN useradd -m -u 1000 -s /bin/bash jenkins

# Add user jenkins to the image
RUN adduser --quiet jenkins && \
# Set password for the jenkins user (you may want to alter this).
    echo "jenkins:jenkins" | chpasswd && \
    mkdir /home/jenkins/.m2
    
RUN chown -R jenkins:jenkins /home/jenkins/.m2/ && \
    chown -R jenkins:jenkins /home/jenkins/.ssh/
    
RUN yum install -y openssh-clients
