source "https://rubygems.org"

gem "github-pages"

# We're using jekyll.
gem "jekyll", "~> 3.9.3"

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
# Redirect /store -> etsy
gem 'jekyll-redirect-from'