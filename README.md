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



2. init the swarm
>Docker swarm init —advertise-adds <—ip —>

join the other nodes (use the tokens)

To make changes,
You simply go into the /flask and /celery
build them again and push them to dockerhub. Make sure to remove cached images if there are any.

to run it on the cloud:
>curl -fsSL https://get.docker.com -o get-docker.sh

>sh get-docker.sh
> https://github.com/MSkogsmo/acc-project

go into the cloned directory 
>docker stack deploy -c . Benchop

To scale:
>docker service scale <--name of worker-->= N 



