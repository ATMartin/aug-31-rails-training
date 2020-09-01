FROM ruby:2.6.6

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ghostscript sqlite3 vim firefox-esr

RUN mkdir -p /app
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN node -v
RUN npm -v

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler
RUN bundle install

RUN npm install -g yarn
RUN yarn install --check-files

COPY . ./

ENV CODESPACES=true 
RUN echo "echo \"Welcome to Test Double's Rails 101: Intro To Ruby & Rails!\"" >> ~/.bashrc

EXPOSE 3000
