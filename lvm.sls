install_lvm:
  pkg.installed:
    {% if grains ['os'] == 'Ubuntu' %}
    - name: "lvm2"
    {% endif %}

{% if grains.itops.swap_size > 0 %}
pvcreate_swap:
 lvm.pv_present:
   - name: "/dev/xvdb"
vgcreate_swapvg:
  lvm.vg_present:
    - name: "swapvg"
    - devices: "/dev/xvdb"
lvcreate_swaplv:
  lvm.lv_present:
    - name: "swaplv"
    - vgname: "swapvg"
    - extents: "100%FREE"
create_swap:
  cmd.run:
    - name: "mkswap /dev/swapvg/swaplv"
    - unless: 'test ! -z "$(blkid -s TYPE -o value /dev/swapvg/swaplv)"'
enable_swap:
  mount.swap:
    - name: "/dev/swapvg/swaplv"
{% endif %}


{% if grains.itops.apps_size > 0 %}
pvcreate_apps:
  lvm.pv_present:
    - name: "/dev/xvdc"
vgcreate_appsvg:
  lvm.vg_present:
    - name: "appsvg"
    - devices: "/dev/xvdc"
lvcreate_appslv:
  lvm.lv_present:
    - name: "appslv"
    - vgname: "appsvg"
    - extents: "100%FREE"
mkfs_apps:
  cmd.run:
    - name: "mkfs.ext4 /dev/appsvg/appslv"
    - unless: 'test ! -z "$(blkid -s TYPE -o value /dev/appsvg/appslv)"'
mount_apps:
  mount.mounted:
    - name: "/apps"
    - device: "/dev/appsvg/appslv"
    - fstype: "ext4"
    - opts: "defaults"
    - dump: "0"
    - pass_num: "2"
    - mkmnt: "True"
    - persist: "True"
{% endif %}
