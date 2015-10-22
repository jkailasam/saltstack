install_python_pip:
   pkg.installed:
      - name: python-pip

install_awscli:
   pip.installed:
     - name: awscli

install_boto:
   pip.installed:
     - name: boto
