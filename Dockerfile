FROM ruby:2.5.0-alpine

RUN mkdir /asrapi
WORKDIR /asrapi

COPY Gemfile Gemfile.lock ./

ENV BUNDLE_PATH /ruby_gems

RUN apk --update --no-cache add build-base postgresql-dev libxml2-dev libxslt-dev nodejs tzdata \
 && bundle config build.nokogiri --use-system-libraries \
 && bundle install --jobs=4 --without development test \

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
