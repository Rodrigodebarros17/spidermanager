FROM ubuntu:latest
# Install vim and ansible
RUN echo "Updating packages"
RUN apt update \
  && apt install vim ansible -y


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
# && ansible-playbook playbooks/gogs_container.yml

# Configure Docker Container
VOLUME ["/home/git"]
EXPOSE 22 3000
#ENTRYPOINT ["/app/gogs/docker/start.sh"]
#CMD ["/bin/s6-svscan", "/app/gogs/docker/s6/"]
CMD ["/bin/bash"]
