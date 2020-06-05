FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
apt-get install -y apt-utils \
build-essential \
libpq-dev \
nodejs \
default-mysql-client \
yarn
RUN yarn install
RUN mkdir /application
WORKDIR /application
ADD Gemfile /application/Gemfile
ADD Gemfile.lock /application/Gemfile.lock
RUN bundle install
ADD . /application
