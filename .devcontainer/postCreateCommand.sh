echo 'postCreateCommand.sh opened'

# bundle install
# bundle exec rubocop --start-server
# rails db:setup

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s $(which zsh)


# # code ~/.zshrc
# # plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# # SH_THEME="powerlevel10k/powerlevel10k"
# # export GPG_TTY=$(tty)

echo 'postCreateCommand.sh closed'
exit 0