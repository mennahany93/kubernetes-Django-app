FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
#ENV PGUSER
#ENV PGPASSWORD
COPY app/Gemfile /myapp/Gemfile
COPY app/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY app /myapp
COPY init.sh ./
CMD ./init.sh
