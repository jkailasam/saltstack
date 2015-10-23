manage_root_key:
  ssh_auth.present:
    - user: jkailasam
    - enc: ssh-rsa
    - comment: jkailasam@allservers
    - source: salt://ssh/id_rsa.pub.root
#    - name:  {{ pillar['users']['root'] }}


