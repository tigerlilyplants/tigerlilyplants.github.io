#! /usr/bin/env bash
# Grab all dependencies.

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add yarn https://github.com/twuni/asdf-yarn.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Install Ruby dependencies.
# https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
# sudo apt-get install autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

asdf install

# https://jekyllrb.com/docs/
gem install jekyll bundler
