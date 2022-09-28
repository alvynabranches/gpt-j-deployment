sudo docker container run --restart=always -v nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name server -d nginx
