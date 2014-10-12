mysql:
  server:
    root_password: 'somepass'
    bind-address: 127.0.0.1
    port: 3306
    user: mysql

  # Manage databases
  database:
    - derek_stegelman_com
    
  # Manage users
  user:
    - name: py_dev
      password: '1234567'
      host: localhost
      databases:
        - database: derek_stegelman_com
          grants: ['all privileges']

  # Override any names defined in map.jinja
  lookup:
    server: mysql-server
    client: mysql-client
    service: mysql
    config: /etc/mysql/my.cnf
    python: python-mysqldb
