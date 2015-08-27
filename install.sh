#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

### Add the saltstack repo
add-apt-repository -y ppa:saltstack/salt

###update and upgrade the filesets
for i in update dist-upgrade ; do 
	apt-get -y $i ; done

## Install salt-mster
apt-get -y install salt-master=2015.5.3+ds-1trusty1

## For syndic, run the following
## apt-get -y install salt-master=2015.5.3+ds-1trusty1 salt-syndic=2015.5.3+ds-1trusty1

## auto accept key
 sed -e /auto_accept: False/ /auto_accept: True/

