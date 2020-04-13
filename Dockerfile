FROM ubuntu:latest

RUN apt-get update -y
WORKDIR /myapp
ADD . /myapp
RUN apt-get install libsqlite3-dev -y
RUN gem install sqlite3 -v '1.4.2' --source 'https://rubygems.org/'
RUN yarn install --check-files
RUN gem install bundler
RUN bundle install
