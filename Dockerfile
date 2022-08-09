FROM python:3.9.5-alpine
WORKDIR /usr/src/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt ./
RUN pip install -r requirements.txt
COPY . /usr/src/app/
RUN python manage.py migrate
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]