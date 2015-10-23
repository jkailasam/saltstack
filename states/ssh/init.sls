#manage_root_key:
#  ssh_auth.present:
#    - user: jkailasam
#    - enc: ssh-rsa
#    - comment: jkailasam@allservers
#    - source: salt://ssh/id_rsa.pub.root
#    - name:  {{ pillar['users']['root'] }}

auth:
  file.managed:
    - name: "/home/jkailasam/.ssh/authorized_keys"
    - user: jkailasam
    - group: jkailasam
    - mode: 0400
    - source: salt://ssh/id_rsa.pub.root.jinja
    - template: jinja

