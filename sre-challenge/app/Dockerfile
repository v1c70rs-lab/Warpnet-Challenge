FROM python:3.12

USER root
RUN useradd -ms /bin/bash warpnet
RUN mkdir /app
RUN chown warpnet /app

USER warpnet
WORKDIR /app
ADD . /app/

RUN pip install -r requirements.txt

# This is definitely a secure way to handle secrets :)
ENV SECRET_KEY="192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf"

EXPOSE 5000
CMD ["python", "application.py"]
