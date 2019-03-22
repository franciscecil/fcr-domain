# Docker  cheatcheet 

> its good practice to use password-stdin

cat password.txt | docker login --username name --password-stdin

docker tag d7876216cdd2 franciscecil/fcr-employee:one


docker run -e "SPRING_PROFILES_ACTIVE=dev" -p 8082:8081 -t fcr-employee:one --name fcr-employee:one

docker run -p 8082:8081 "d7876216cdd2"

docker rm $(docker ps -a -q) -- removes and deletes all the stopped containers


docker stop $(docker ps -a -q) stop all containers

docker rm $(docker ps -a -q)

docker rmi $(docker images -q)

docker image prune -a

docker image inspect <IMAGE_ID>
 
docker swarm --help



