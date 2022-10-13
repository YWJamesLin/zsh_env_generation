#!/bin/sh
# User Environment Initialization
# 2015.09.30 Created by YWJamesLin

# Environment Variables
#   ENV : 0 for normal users, 1 for root
ENV="0"

#   We also provide ViM Profile to generate, 1 to generate , or not to with 0
Generate_ViM="1"

# ViM
if [ ${Generate_ViM} == "1" ]; then
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_basic_vimrc.sh
  sed -i 's/set cmdheight=/"set cmdheight=/' ~/.vimrc
  sed -i 's/set foldcolumn=/"set foldcolumn=/' ~/.vimrc
  sed -i '142i " Show line numbers' ~/.vimrc
  sed -i '143i set nu' ~/.vimrc
  sed -i 's/colorscheme desert/ colorscheme default/' ~/.vimrc
  sed -i 's/set shiftwidth.*$/set shiftwidth=2/' ~/.vimrc
  sed -i 's/set tabstop.*$/set shiftwidth=2/' ~/.vimrc
fi

# zsh
curl -L http://install.ohmyz.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/ZSH_THEME=.*$/ZSH_THEME="YWJLTheme"/' ~/.zshrc
sed -i 's/plugins=.*$/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc
git clone https://github.com/YWJamesLin/YWJLTheme.git ~/YWJLTheme
cp ~/YWJLTheme/YWJLTheme.zsh-theme ~/.oh-my-zsh/themes/
rm -rf ~/YWJLTheme

case ${ENV} in
  "0")
  curl -L https://raw.githubusercontent.com/YWJamesLin/zsh_env_generation/master/zshrc_user >> ~/.zshrc
  ;;
  "1")
  curl -L https://raw.githubusercontent.com/YWJamesLin/zsh_env_generation/master/zshrc_root >> ~/.zshrc
  ;;
esac

# Done
echo "UserInit Complete."
