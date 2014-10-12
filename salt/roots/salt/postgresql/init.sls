pg_hba.conf:
    file.managed:
        - name: /etc/postgresql/9.3/main/pg_hba.conf
        - source: salt://postgresql/pg_hba.conf
        - user: postgres
        - group: postgres
        - mode: 644
        - require:
            - pkg: postgresql-9.3

postgresql:
    pkg.installed:
        - name: postgresql-9.3
    service.running:
        - enable: True
        - watch:
            - file: /etc/postgresql/9.3/main/pg_hba.conf
        - require:
            - pkg: postgresql-9.3

postgresql-9.1-dbg:
    pkg.installed:
        - name: postgresql-9.3-dbg

postgresql-server-dev-9.3:
    pkg.installed:
        - name: postgresql-server-dev-9.3


postgres-db:
  postgres_database.present:
    - name: {{ pillar['postgresql']['db_name'] }}
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - owner: {{ pillar['postgresql']['db_user'] }}
    - runas: {{ pillar['postgresql']['db_user'] }}