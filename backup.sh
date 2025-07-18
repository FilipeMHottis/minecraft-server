TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_DIR="./backups"
WORLD_DIR="./minecraft-data"

mkdir -p "$BACKUP_DIR"

echo "Iniciando backup do servidor Minecraft..."

tar -czf "$BACKUP_DIR/mc-backup-$TIMESTAMP.tar.gz" -C "$WORLD_DIR" .

echo "Backup criado em $BACKUP_DIR/mc-backup-$TIMESTAMP.tar.gz"
