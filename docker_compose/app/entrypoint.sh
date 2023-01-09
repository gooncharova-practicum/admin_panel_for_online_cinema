#!/bin/sh 
if [ "$DATABASE" = "postgres" ] 
then 
    echo "DB not yet run..." 
    while ! nc -z $DB_HOST $DB_PORT; do 
      sleep 0.1 
    done 
    echo "DB did run." 
fi 

# shellcheck disable=SC2164 
cd /app

python manage.py flush --no-input 
python manage.py migrate 
python manage.py createsuperuser --noinput 
python manage.py collectstatic --noinput 
gunicorn --bind 0.0.0.0:8000 config.wsgi 
exec "$@" 