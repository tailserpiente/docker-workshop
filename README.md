# docker-workshop
workshop codespaces


    1  python -V
    2  PS1="> " 
    4  echo 'PS1="> "' >~/.bashrc

    docker run --entrypoint=bash -it python:3.13
    # удалить все контейнеры, которые выведутся в docker ps -aq
    docker rm `docker ps -aq`  

docker rm $(docker ps -aq)


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

uv run jupyter notebook
docker-compose up -d 


#под docker-compose - pipeline_default  

  
 docker run -it --rm \
 --network=pipeline_default \
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




 
Now we have zsh completion. Type "echo 'source /home/codespace/yandex-cloud/completion.zsh.inc' >>  ~/.zshrc" to install itTo complete installation, start a new shell (exec -l $SHELL) or type 'source "/home/codespace/.bashrc"' in the current one
>  
> echo 'source /home/codespace/yandex-cloud/completion.zsh.inc' >>  ~/.zshrc
> source "/home/codespace/.bashrc"

yc iam create-token --impersonate-service-account-id $SA_ID

SA_ID=$(yc iam service-account get mlops-rns-sa --format json | jq -r '.id')
export YC_TOKEN=$(yc iam create-token --impersonate-service-account-id $SA_ID)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

ssh-keygen -t ed25519 -C "comment" -f ~/.ssh/vm_ed25519_key


yandex_compute_instance.vm-2: Creation complete after 33s [id=fhmpjrcjomnqlk4c453n]
yandex_compute_instance.vm-1: Creation complete after 33s [id=fhm314436jdj0pt0nrvu]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_vm_1 = "158.160.36.198"
external_ip_address_vm_2 = "89.169.150.117"
internal_ip_address_vm_1 = "192.168.10.20"
internal_ip_address_vm_2 = "192.168.10.32"
> 

> yc compute instance get terraform1 --format json | jq '.network_interfaces[] | {ip_address: .primary_v4_address.address, nat_ip: .primary_v4_address.one_to_one_nat.address}'
{
  "ip_address": "192.168.10.20",
  "nat_ip": "158.160.36.198"


  ssh -i ~/.ssh/vm_admin_ed25519_key -l vm_admin 158.160.38.203


  for vm in $(yc compute instance list --format json | jq -r '.[].name'); do
    echo "Останавливаю $vm..."
    yc compute instance stop $vm
done

