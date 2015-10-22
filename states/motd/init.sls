create_motd:
  file.managed:
    - name: "/etc/update-motd.d/00-netflix"
    - user: root
    - group: root
    - mode: 0755
    - source: salt://motd/motd.template
    - template: jinja

delete_help-text:
  file.absent:
    - name: "/etc/update-motd.d/10-help-text"

delete_landscape-sysinfo:
  file.absent:
    - name: "/etc/update-motd.d/50-landscape-sysinfo"
