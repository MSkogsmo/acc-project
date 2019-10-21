1. Install docker however you like.
This works on linux:
on mac there is docker for mac.

>curl -fsSL https://get.docker.com -o get-docker.sh
>sh get-docker.sh
Run it:
> docker-compose up -d

see if they are running:
> docker-compose ps
test it:
localhost:5000/add/5/10

we need to change the app.py in /flask & tasks.py in /celery.

scale it does not work locally but it does on the swarm.
docker-compose scale web=5

2. init the swarm
>Docker swarm init —advertise-adds <—ip —>
join the other nodes (use the tokens)

to make sure our changes in tasks and app is seen we need to replace the dockerfiles on the dockerhub, I can do that or teach you.
You simply go into the /flask and /celery
build them again and push them to dockerhub then change the compose file to fetch the new ones. 

to run it on the cloud:
remove the comments # in the compose file
>curl -fsSL https://get.docker.com -o get-docker.sh
>sh get-docker.sh
>docker stack deploy -c <---file---> celeryapp

see how it works
