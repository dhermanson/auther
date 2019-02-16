FROM nginx:alpine

RUN apk add --update \
  bash \
  apache2-utils \
  && mkdir -p /etc/apache2 \
  && touch /etc/apache2/.htpasswd

EXPOSE 80

COPY ./start.sh /start.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./site /usr/share/nginx/html

ENTRYPOINT ["/start.sh"]
CMD ["nginx", "-g", "daemon off;"]
