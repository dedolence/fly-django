# syntax=docker/dockerfile:1

FROM python:3

WORKDIR /app

COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt

COPY . .

RUN python3 manage.py collectstatic --no-input

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "fly_django.wsgi"]