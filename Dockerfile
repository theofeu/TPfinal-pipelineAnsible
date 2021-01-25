FROM ansible

ARG ssh_prv_key

RUN apk update && apk add ansible openssh-client openssh-keygen sshpass && \
    adduser -D -s /bin/sh ansible

USER ansible
RUN mkdir /home/ansible/playbook && \
    echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

WORKDIR /home/ansible/playbook

ENTRYPOINT [ "ansible-playbook" ]
