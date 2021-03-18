FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

WORKDIR /src

COPY Gemfile* /src/
RUN bundle install
RUN yarn install --check-files

COPY ./ /src/

RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD rm -f tmp/pids/server.pid && rails server -p 3000 -b 0.0.0.0
