FROM ruby:2.6.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql \
                                             postgresql-client \
                                             postgresql-contrib \
                                             build-essential \
                                             libpq-dev curl git \
                                             ruby-dev yarn
COPY . /t-finder-api

WORKDIR /t-finder-api

CMD ["sh", "script/start.sh"]
