FROM ubuntu:18.04



RUN apt-get update -y \
    && apt-get install -y python3-pip python3-dev

RUN pip3 install --upgrade pip
RUN pip3 install flask flask_json
RUN pip3 install transformers
RUN pip3 install torch

ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

RUN mkdir -p julibert

EXPOSE 8866

#Download nltk
WORKDIR /julibert/
COPY ./ /julibert/

CMD ["python3", "serve.py"]
RUN ["python3", "-c", "from init_model import Initializer; Initializer()"]

ENV TRANSFORMERS_OFFLINE=1
