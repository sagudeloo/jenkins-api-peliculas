FROM python:3.8

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt --upgrade

COPY . .

ENV FLASK_APP "entrypoint:app"
ENV FLASK_ENV "development"
ENV APP_SETTINGS_MODULE "config.default"

RUN flask db init
RUN flask db revision --rev-id a82cb2d4551e
RUN flask db migrate  -m "Initial_db"
RUN flask db upgrade

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]