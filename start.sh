#!/bin/bash
 
# Instala as Gems
bundle check || bundle install
 
# Instala os pacotes JS
yarn install
 
# Roda nosso servidor
bundle exec puma -C config/puma.rb