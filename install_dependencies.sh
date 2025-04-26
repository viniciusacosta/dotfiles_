#!/bin/bash

echo "Atualizando repositórios..."
sudo apt update && sudo apt upgrade -y

echo "Instalando pacotes necessários..."
xargs sudo apt install -y <pacotes.txt

echo "Instalação de dependências finalizada!"
