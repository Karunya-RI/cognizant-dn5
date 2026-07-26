# Run Django app with Gunicorn
gunicorn myproject.wsgi:application --bind 0.0.0.0:8000
