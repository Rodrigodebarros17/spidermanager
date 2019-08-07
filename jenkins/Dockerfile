FROM ubuntu:latest
# Install vim and ansible
RUN echo "Updating packages"
RUN apt update \
  && apt install vim ansible openssh-server git -y


RUN echo "Configing ansible"
# Config ansible
RUN mkdir /etc/ansible/playbooks
WORKDIR /etc/ansible
COPY container_in/ansible.cfg .
COPY container_in/hosts .
COPY container_in/jenkins_container.yml playbooks/
                  
RUN echo "Installing Ansible Galaxy roles and runing playbook"
# Install Necessary Ansible galaxy and Run playbook
RUN ansible-galaxy install geerlingguy.jenkins
RUN ansible-playbook playbooks/jenkins_container.yml

# Configure Docker Container
VOLUME ["/var/jenkins_backup"]
EXPOSE 22 8080
