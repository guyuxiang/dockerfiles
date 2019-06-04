docker run --rm -it --shm-size=2gb --name code-server -p 127.0.0.1:8443:8443 -v c:/Users/yuxia/docker_volumes/code-server:/root:cached yuxianggu/code-server:latest
docker build -t code-serve c:/Users/yuxia/projects/dockerfiles/code-server
docker run --rm -it --shm-size=2gb --name code-server -p 127.0.0.1:8443:8443 -v c:/Users/yuxia/docker_volumes/code-server:/root:cached code-server:latest