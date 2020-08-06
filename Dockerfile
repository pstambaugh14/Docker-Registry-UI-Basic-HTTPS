FROM: localhost:5000/pstambaugh14/registry-ui:latest
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/fullchain.pem /etc/nginx/certs/fullchain.pem
COPY ./nginx/privkey.pem /etc/nginx/certs/privkey.pem
EXPOSE 5000
