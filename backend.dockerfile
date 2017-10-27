FROM python:3.6

RUN apt-get update && apt-get install -y \
    gcc \
    vim \
    sqlite3 \
    python-dev \
    --no-install-recommends

RUN pip install --upgrade pip && pip install --no-cache-dir Django

ADD backend /usr/src/app
ADD VERSION /usr/src/app/VERSION
WORKDIR /usr/src/app

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:8000/api/get-color || exit 1

CMD echo "#$(openssl rand -hex 3)" > COLOR && ./manage.py runserver 0.0.0.0:8000
