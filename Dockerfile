FROM ruby:2.6.5

ENV RAILS_ENV=production

RUN apt-get update -qq && \
  apt-get install -y build-essential \ 
  libpq-dev \        
  nodejs      

RUN mkdir /workdir
WORKDIR /workdir

ADD ./Gemfile /workdir/Gemfile
ADD ./Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler 
RUN bundle install
ADD . /workdir

# 本番環境用
# COPY start.sh /start.sh
# RUN chmod 744 /start.sh
# CMD ["sh", "/start.sh"]