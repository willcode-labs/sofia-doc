FROM ruby
MAINTAINER 'William Borba' <william.borba@deliverit.com.br>

RUN apt-get update && apt-get install -y nodejs git \
    && apt-get clean && cd /home
