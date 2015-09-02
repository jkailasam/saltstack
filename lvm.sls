install_lvm:
  pkg.installed:
    {% if grains ['os'] == 'Ubuntu' %}
    - name: "lvm2"
    {% endif %}

/tmp/apps_size:
  file.managed:
    {% if grains.itops.apps_size > 0 %}
    - contents: "Apps size is {{ grains.itops.apps_size }}"
    {% else %}
    - contents: "Apps size undefined"
    {% endif %}

{% if grains.itops.swap_size > 0 %}
swap_disk:
 lvm.pv_present:
   - name: "/dev/xvdb"
{% endif %}

{% if grains.itops.apps_size > 0 %}
apps_disk:
  lvm.pv_present:
    - name: "/dev/xvdc"
create_appsvg:
  lvm.vg_present:
    - name: "appsvg"
    - devices: "/dev/xvdc"
{% endif %}
