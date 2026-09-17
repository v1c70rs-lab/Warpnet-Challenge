FROM python:3.12

USER root
RUN useradd -ms /bin/bash warpnet
RUN mkdir /app
RUN chown warpnet /app

USER warpnet
WORKDIR /app
ADD . /app/

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "application.py"]

