echo "🛑 Parando os containers do servidor Minecraft..."

docker-compose down

if [ $? -eq 0 ]; then
  echo "✅ Servidor parado com sucesso!"
else
  echo "❌ Falha ao parar o servidor."
  exit 1
fi
