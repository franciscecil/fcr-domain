#
# Script to start application service within your docker stack
#

export APP_IMAGE=franciscecil/fcr-employee:one

export currentDirectory=`pwd`
cd ${currentDirectory/scripts/}


docker swarm init

	# Convert any command line parameters to be comma delimited and add them to EXTRA_PROFILES
	echo "Adding extra spring profiles: $@"
    export EXTRA_PROFILES=`IFS=","; echo "$*"`
    export EXTRA_PROFILES=",${EXTRA_PROFILES}"


echo "Deploying service to stack"
docker stack deploy -c add-compose/docker-compose.yml fcr-domain

echo " "
echo "To tail the logs of the service:"
echo "docker service logs --follow fcr-domain_fcr-domain"
echo " "