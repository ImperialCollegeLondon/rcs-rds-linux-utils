
#!/bin/sh

# 7/8/2019 MJHarvey 

# Create the mount points and fstab entries for all the users in the RDS groups 
# rds-000056 (adobe_addiction_and_obesity_cohort) and rds-000347 (adobe-cohort)

U=""
for G in rds-000045 rds-000347; do
	U="$(getent group $G | sed 's/^.*://g' | sed 's/,/ /g')"

	for USER in $U; do
		id "$USER" >/dev/null 2>&1
		if [ "$?" == "0" ]; then
			mkdir -p /rds/general/user/$USER
			chown $USER /rds/general/user/$USER
			grep -q "/rds/general/user/$USER" /etc/fstab
			if [ "$?" != "0" ]; then
				echo "//rds.ic.ac.uk/rds/user/$USER /rds/general/user/$USER cifs users,uid=$USER,gid=$G,username=$USER,vers=3.02,noperm,file_mode=0700,dir_mode=0700,nosetuids" >> /etc/fstab
				echo "tmpfs /rds/general/user/$USER/home/.x2go tmpfs users" >> /etc/fstab
			fi
		fi
	done	
done



 
