FROM ubuntu:latest
# Install vim and ansible
RUN echo "Updating packages"
RUN apt update \
  && apt install vim ansible openssh-server -y


RUN echo "Configing ansible"
# Config ansible
RUN mkdir /etc/ansible/playbooks
WORKDIR /etc/ansible
COPY container_in/ansible.cfg .
COPY container_in/hosts .
COPY container_in/gogs_container.yml playbooks/
                  
RUN echo "Installing Ansible Galaxy roles and runing playbook"
# Install Necessary Ansible galaxy and Run playbook
RUN ansible-galaxy install geerlingguy.gogs
RUN ansible-playbook playbooks/gogs_container.yml

# Configure Docker Container
VOLUME ["/var/gogs"]
EXPOSE 22 3000
#CMD ["service","gogs","restart"]  
#ENTRYPOINT ["/bin/bash"]
