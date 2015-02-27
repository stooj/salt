apache:
  pkg:
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% elif grains['os'] == 'Ubuntu' % or grains['os'] == 'Debian' %}
    - name: apache2
    {% endif %}
    - installed
  service:
    - running
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% elif grains['os'] == 'Ubuntu' % or grains['os'] == 'Debian' %}
    - name: apache2
    {% endif %}
    - watch:
      - file: /etc/apache2/sites-available/default    # Restart the service if this file changes
    - require:
      - pkg: apache

/var/www/index.html:
  file:
    - managed
    - source: salt://webserver/index.html
    - require:
      - pkg: apache
