FROM python:3.10

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get install --no-install-recommends -y build-essential curl git python3.10

# install dependencies
RUN pip install --no-cache-dir --upgrade pip wheel
COPY ./requirements.txt /var/tmp/requirements.txt
RUN pip install -r /var/tmp/requirements.txt 
RUN rq-dashboard --debug -v &