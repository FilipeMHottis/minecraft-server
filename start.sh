echo "🔄 Sincronizando plugins..."
./sync-plugins.sh

if [ $? -ne 0 ]; then
  echo "❌ Erro ao sincronizar plugins. Abortando startup."
  exit 1
fi

echo "🐳 Iniciando containers com docker-compose..."
docker-compose up -d

if [ $? -eq 0 ]; then
  echo "✅ Servidor iniciado com sucesso!"
else
  echo "❌ Falha ao iniciar o servidor."
  exit 1
fi
