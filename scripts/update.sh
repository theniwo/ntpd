#!/usr/bin/env bash

FRIENDLYNAME=NTPD
CONTAINERNAME=ntpd
DOCKERREPO=theniwo
DOCKERIMAGE=ntpd
DOCKERTAG=latest
DIR=/root/Settings/Linux/scripts/docker
PARAMETER="$2"

function update-git(){
	echo "Adding all files to HEAD"
	git add .
	echo "Committing git"
	git commit --all -m "Auto commit"
	echo "pushing to git"
	git push origin master
}

function update-docker(){
	echo "Committing to docker hub"
	docker commit $(docker inspect --format='{{.ID}}' $CONTAINERNAME) $DOCKERREPO/$DOCKERIMAGE:$DOCKERTAG && docker push $DOCKERREPO/$DOCKERIMAGE:$DOCKERTAG
	if [ $? -eq 0 ] ; then
		echo "$FRIENDLYNAME has commited and automatically pushed to docker hub"
		logger -i -t $CONTAINERNAME "$FRIENDLYNAME has commited and automatically pushed to docker hub"
	else
		echo "$FRIENDLYNAME has failed to commit and automatically push to docker hub"
		logger -i -t $CONTAINERNAME "$FRIENDLYNAME has failed to commit and automatically push to docker hub"
	fi
}



var="$1"
case "$var" in
   git)
	if [[ $PARAMETER == "--force" ]] || [[ $PARAMETER == "-f" ]]; then
	  echo "Forcing Commit"
	  date +%Y%m%d%H%M%S > $DIR/$CONTAINERNAME/CHANGEFILE
	fi
   	update-git
        ;;
   docker)
	update-docker
        ;;
   *)
   	echo Use either "$0" git or docker
   	;;
esac
