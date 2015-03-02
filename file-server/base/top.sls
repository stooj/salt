base:
  '*':
    - common

django:
  'G@roles:django_server':
    - ntp
    - nginx
    - python3
    - python3-pip
    - virtualenv
