#!/bin/bash

echo "🚀 Atualizando..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando pacotes..."
xargs -r -a pacotes.txt -I {} bash -c 'sudo apt install -y {} || echo "⚠️ Erro instalando {} - ignorado"'

# --------------------------------------
# Instalar dependências de compilação
# --------------------------------------
sudo apt install -y \
  meson ninja-build libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev \
  libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev \
  libstartup-notification0-dev libxcb-randr0-dev libxcb-shape0-dev

# --------------------------------------
# Clonar e compilar o i3 oficial (4.22)
# --------------------------------------
git clone https://github.com/i3/i3.git ~/i3-gaps
cd ~/i3-gaps
git checkout 4.22
meson build
ninja -C build
sudo ninja -C build install
cd ~

# --------------------------------------
# (Opcional) Remover pasta temporária usada
# --------------------------------------
# rm -rf ~/i3-gaps


echo "✅ Finalizado!"
