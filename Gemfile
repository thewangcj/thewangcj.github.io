# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'jekyll', '~> 4.3'

group :jekyll_plugins do
  gem "jekyll-paginate"
  gem 'jekyll-sitemap'
  gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
end

group :development do
  gem 'jekyll-admin', '~> 0.12'
end

gem "wdm", platforms: [:mingw, :mswin, :x64_mingw]
