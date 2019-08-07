Check this repo out to /opt/rcs-rds-linux-utils


* sbin/make_rds_mount.sh

  For a given set of RDS groups, gets the members and creates:
	-  RDS mount points
  -  /etc/fstab entries for the RDS mount
  -  /etc/fstab entries for tmpfs overlay for ~/.x2go

 This script assumes the machine is using ou=hpc or ou=rds
 
 - Put this script in the root crontab

* bin/rdsmount
* bin/rdsunmount

 - To be run by a user to mount/unmount their RDS share

* etc/profile.d/rds.sh

 - profile script to set RDS variables and PATH
 - symlink to it from /etc/profile.d
  
