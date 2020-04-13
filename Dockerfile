FROM ubuntu:latest

RUN apt-get update -y && \
      apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN apt-get install gnupg2 -y
WORKDIR /myapp
ADD . /myapp
RUN apt-get install curl -y
RUN apt-get install libsqlite3-dev -y
RUN apt-get install sqlite3 -y
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install yarn
RUN yarn install --check-files
RUN gem install bundler
RUN bundle install
ENTRYPOINT ["rails" , "s"]
