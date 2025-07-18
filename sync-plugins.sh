SRC_DIR="./plugins"
DEST_DIR="./minecraft-data/plugins"

# Verifica se a pasta de origem existe
if [ ! -d "$SRC_DIR" ]; then
  echo "❌ A pasta $SRC_DIR não existe."
  exit 1
fi

# Cria o diretório de destino se não existir
mkdir -p "$DEST_DIR"

# Copia os plugins
cp -u "$SRC_DIR"/*.jar "$DEST_DIR"

echo "✅ Plugins copiados de $SRC_DIR para $DEST_DIR"
