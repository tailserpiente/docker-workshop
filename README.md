# docker-workshop
workshop codespaces


    1  python -V
    2  PS1="> " 
    4  echo 'PS1="> "' >~/.bashrc

    docker run --entrypoint=bash -it python:3.13
    # удалить все контейнеры, которые выведутся в docker ps -aq
    docker rm `docker ps -aq`  

    docker run -it --rm -v $(pwd)/test:/app/test --entrypoint=bash python:3.13.11-slim

# при venv в корне проекта
    docker build -t test:pandas -f ./pipeline/Dockerfile .

# при venv в pipeline 

docker build -t test:pandas  .

 docker build -t taxi_ingest:v001 . 

docker network create pg-network

 docker run -it --rm \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v ny_taxi_postgres_data:/var/lib/postgresql \
  -p 5432:5432 \
  --network=pg-network \
  --name pgdatabase \
  postgres:18


 docker run -it --rm \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql \
  -p 5432:5432 \
  --network=pg-network \ 
  --name pgdatabase \
  postgres:18

 docker run -it --rm \
 --network=pg-network \
 taxi_ingest:v001 \
   --pg-user=root \
  --pg-pass=root \
  --pg-host=pgdatabase \
  --pg-port=5432 \
  --pg-db=ny_taxi \
  --target-table=yellow_taxi_trips_2 \
  --year=2021 \
  --month=1 \
  --chunksize=100000

  docker run -it \
  -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
  -e PGADMIN_DEFAULT_PASSWORD="root" \
  -v pgadmin_data:/var/lib/pgadmin \
  -p 8085:80 \
  --network=pg-network \
  --name pgadmin \
  dpage/pgadmin4

  http://localhost:8085

  