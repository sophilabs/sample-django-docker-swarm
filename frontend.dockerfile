FROM nginx:1.10

RUN apt-get update && apt-get install -y curl vim bzip2 libfontconfig

WORKDIR /etc/nginx

ADD app.conf /etc/nginx/app.conf

RUN mkdir /etc/nginx/sites-available \
  && cp /etc/nginx/app.conf /etc/nginx/sites-available/ \
  && chmod 754 /etc/nginx/sites-available/app.conf \
  && mkdir /etc/nginx/sites-enabled \
  && ln -sf /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled \
  && sed -i '31s/.*/\n\tsendfile \toff;\n/' /etc/nginx/nginx.conf \
  && sed -i '24s/.*/\n\tinclude \/etc\/nginx\/sites-enabled\/*.conf;\n/' \
  /etc/nginx/nginx.conf

ADD frontend /usr/src/app
ADD VERSION /usr/src/app
WORKDIR /usr/src/app

RUN sed -i "s/<version>/`cat VERSION`/g" app.js && sed -i "s/#version/`cat VERSION`/g" index.html

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/ || exit 1

CMD nginx -g 'daemon off;'
