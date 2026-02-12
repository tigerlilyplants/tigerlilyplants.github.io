source "https://rubygems.org"

# We're using jekyll.
gem "jekyll", "~> 4.4.1"

# Theme
gem "minima", "~> 2.5"

# Plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
end

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
gem 'jekyll-github-metadata'
gem 'jekyll-titles-from-headings'
gem 'jekyll-gist'
gem 'jekyll-relative-links'
# gem 'jekyll-last-modified-at'
gem 'jekyll-paginate'
gem 'jekyll-bluesky'