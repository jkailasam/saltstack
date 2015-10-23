manage_root_key:
  ssh_auth.present:
    - user: jkailasam
    - enc: ssh-rsa
    - comment: jkailasam@allservers
    - contents_pillar: {{ pillar['users']['root'] }}
#    - source: salt://ssh/id_rsa.pub.root


