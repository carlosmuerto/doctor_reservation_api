FROM ruby:3.1.2-bullseye

# # install and postgre dependencies
RUN apt-get update -qq
RUN apt-get install -y postgresql-client
# RUN apt-get install -y yarn

# Install Rails
RUN gem install rails

# # INSTALL zsh
RUN apt-get install -y zsh zplug

# # SET ZSH default
RUN chsh -s $(which zsh)
