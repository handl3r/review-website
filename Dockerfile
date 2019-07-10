FROM ruby:2.6.3
# Information about author
LABEL author.name="ThaiBuiXuan" \
  author.email="thaibuixuan34@gmail.com"
RUN apt-get update && \
  apt-get install -y nodejs nano

ENV APP_PATH /my_app
WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock $APP_PATH/
RUN bundle install --without production --retry 2 \
  --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1`

  # Add a script to be executed every time the container starts.
COPY docker/server.sh /usr/bin/
RUN chmod +x /usr/bin/server.sh
EXPOSE 3000
CMD ["/usr/bin/server.sh"]
