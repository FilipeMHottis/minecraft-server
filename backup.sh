# Configurações
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_DIR="./backups"
WORLD_DIR="./minecraft-data"
MAX_BACKUPS=3

# Cria pasta local de backup se não existir
mkdir -p "$BACKUP_DIR"

echo "📦 Iniciando backup do servidor Minecraft..."

# Cria o backup local
BACKUP_FILE="mc-backup-$TIMESTAMP.tar.gz"
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$WORLD_DIR" .

echo "✅ Backup criado: $BACKUP_DIR/$BACKUP_FILE"

# Limpa backups antigos localmente
echo "🧹 Limpando backups locais antigos..."
ls -1t "$BACKUP_DIR"/mc-backup-*.tar.gz | tail -n +$(($MAX_BACKUPS + 1)) | xargs -r rm --

echo "🎉 Backup completo com sucesso!"
