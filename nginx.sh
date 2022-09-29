sudo docker container run --restart=always -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf -p 80:80 -p 443:443 --name server -d nginx
