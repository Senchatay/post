FROM node:19.4-alpine as builder
WORKDIR /usr/src/app

COPY package*.json yarn.lock ./

RUN npm install
ENV PATH /usr/src/node_modules/.bin:$PATH

COPY . .
RUN yarn build:css

FROM ruby:3.0.0 as development

COPY  --from=builder /usr/src/app /usr/src/app
WORKDIR /usr/src/app

RUN gem install bundler:2.3.5
RUN bundle install

CMD ["rails s -b 0.0.0.0"]