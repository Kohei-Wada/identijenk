FROM python:3.10.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
RUN pip3 install --upgrade pip && pip3 install Flask==2.2.2 uWSGI==2.0.21 requests==2.27.1 redis==4.5.1
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]
