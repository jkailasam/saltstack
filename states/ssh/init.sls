#manage_root_key:
#  ssh_auth.present:
#    - user: jkailasam
#    - enc: ssh-rsa
#    - comment: jkailasam@allservers
#    - source: salt://ssh/id_rsa.pub.root
#    - name:  {{ pillar['users']['root'] }}

auth:
  file.managed:
    - name: "/root/.ssh/authorized_keys"
    - user: root
    - group: root
    - mode: 0400
    - source: salt://ssh/id_rsa.pub.root.jinja
    - template: jinja

