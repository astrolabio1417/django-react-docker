release: cd backend && python manage.py makemigrations && python manage.py migrate
web: cd backend && gunicorn backend.asgi:application -b 0.0.0.0:8087 -k uvicorn.workers.UvicornWorker