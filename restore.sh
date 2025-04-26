#!/bin/bash

echo "🚀 Restaurando Dotfiles via HTTPS..."

# Atualiza pacotes e instala git
sudo apt update && sudo apt upgrade -y
sudo apt install git -y

# Clona novamente o repositório via HTTPS se ainda não existir
if [ ! -d ~/dotfiles ]; then
  echo "📦 Clonando dotfiles..."
  git clone https://github.com/viniciusacosta/dotfiles.git ~/dotfiles
  cd ~/dotfiles
else
  echo "📂 Pasta dotfiles já existe, usando ela..."
  cd ~/dotfiles
fi

# Instala dependências
echo "📜 Instalando dependências..."
./install_dependencies.sh

# Copia configurações para ~/.config
echo "🛠️ Restaurando configurações..."
cp -r config/* ~/.config/

# Copia arquivos ocultos (como .bashrc, .zshrc, .tmux.conf)
[ -f .bashrc ] && cp .bashrc ~/.bashrc
[ -f .zshrc ] && cp .zshrc ~/.zshrc
[ -f .tmux.conf ] && cp .tmux.conf ~/.tmux.conf

echo "✅ Dotfiles restaurados com sucesso!"
echo "💡 Recomendo dar um reboot: sudo reboot"
