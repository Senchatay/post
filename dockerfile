FROM ruby:3.0.0

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.3.5
RUN bundle install

COPY . .

CMD ["rails s -b 0.0.0.0"]