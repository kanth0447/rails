FROM ubuntu:latest

RUN apt-get update -y
WORKDIR /myapp
ADD . /myapp
RUN apt-get install libsqlite3-dev -y
RUN apt-get install sqlite3 -y
RUN yarn install --check-files
RUN gem install bundler
RUN bundle install
ENTRYPOINT ["rails" , "s"]
