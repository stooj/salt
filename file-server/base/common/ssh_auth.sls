salt-master:
  ssh_auth:
    - present
    - user: root
    - source: salt://files/salt-master.id_rsa.pub
