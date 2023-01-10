FROM jenkins/jenkins

USER root

RUN apt-get update && \ 
    apt-get install -y ansible

# RUN apt-get update && apt-get install python3-pip -y && \
#     pip3 install ansible --upgrade &&\
#     apt-get upgrade -y && apt-get update

# #Use apk to add python3 and then start bootstrapping pip
# RUN apk add python3 && \
#     curl -O https://bootstrap.pypa.io/get-pip.py && \
#     python3 get-pip.py && \
#     pip install ansible --upgrade

# #To have a clean environment with the typical aliases
# RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
#         if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
#         rm -r /root/.cache

COPY ./remote-key /var/jenkins_home/ansible/remote-key

USER jenkins
