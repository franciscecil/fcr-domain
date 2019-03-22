export currentDirectory=`pwd`
cd ${currentDirectory/scripts/}

networkWaitTime=10

grep 'image:' docker-compose/docker-compose-local.yml | cut -c 12- | while read -r line ; do
    docker pull $line
    # If there are errors, let the user know what to do to remediate them
    if [ $? -ne 0 ]
    then
        echo "It looks like there was an issue pulling this image from DTR. Please check your network or CNTLM settings."
    fi
done

docker swarm init

docker network ls | grep --quiet fcr-ntwk

if [ $? -ne 0 ]
then
	echo "Creating the fcr-ntwk Network"
	docker network create --driver overlay --attachable  fcr-ntwk
	sleep ${networkWaitTime}
else
	echo " fcr-ntwk Network already exists, skipping creation"
fi

COMPOSE_CONVERT_WINDOWS_PATHS=1 MSYS_NO_PATHCONV=1 docker stack deploy -c docker-compose/docker-compose-local.yml fcr-domain

HTML_FILE="fcr-domain.html"
TITLE="Docker Stack: fcr-domain"