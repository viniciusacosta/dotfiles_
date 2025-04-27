#!/bin/bash

echo "🚀 Atualizando..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando pacotes..."
xargs -r -a pacotes.txt -I {} bash -c 'sudo apt install -y {} || echo "⚠️ Erro instalando {} - ignorado"'

echo "✅ Finalizado!"
