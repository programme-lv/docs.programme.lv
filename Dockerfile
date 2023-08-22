FROM ruby:latest
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install
COPY . .
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
