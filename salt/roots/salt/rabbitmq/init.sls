rabbitmq:
    pkg.installed:
        - name: rabbitmq-server

rabbitmq-server:
  service.running:
    - enable: True