FROM jekyll/jekyll:stable
WORKDIR /blog
COPY . .
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && bundle config mirror.https://rubygems.org https://gems.ruby-china.com \
    && chown -R jekyll:jekyll /blog \
    && chmod g+w Gemfile.lock \
    && bundle install
CMD ["bundle", "exec", "jekyll", "serve"]