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

