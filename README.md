# 🧊 Servidor Minecraft com Docker + Playit.gg

Servidor Minecraft Java Edition (Vanilla ou Paper) com:

- Docker
- Tunelamento via [playit.gg](https://playit.gg)
- Suporte a plugins
- Backups automáticos
- Scripts para facilitar o uso

---

## 📦 Pré-requisitos

- Docker e Docker Compose instalados
- Conta gratuita no [Playit.gg](https://playit.gg)

---

## 🔐 Como obter sua SECRET_KEY do Playit.gg

1. Acesse: https://playit.gg/login  
2. Faça login ou crie uma conta  
3. Crie seu agente Docker: https://playit.gg/account/agents/new-docker  
4. Copie sua `SECRET_KEY` 
5. Abra o arquivo `docker-compose.yml` e edite:

```yaml
playit:
  environment:
    SECRET_KEY: your_secret_key_here
```

---

## 🚀 Como usar

### 🔃 Iniciar o servidor

```bash
./start.sh
```

- Sincroniza os plugins da pasta `./plugins`
- Inicia o servidor e o agente do Playit com Docker Compose

### 🛑 Parar o servidor

```bash
./stop.sh
```

- Para e remove os containers com segurança

### 📁 Fazer backup manual

```bash
./backup.sh
```

- Cria um `.tar.gz` na pasta `./backups` com o conteúdo de `minecraft-data/`

### 🔁 Sincronizar plugins manualmente

```bash
./sync-plugins.sh
```

- Copia os plugins `.jar` da pasta `./plugins` para `minecraft-data/plugins/`

### 💡 Lembre-se de tornar os scripts executáveis:

```bash
chmod +x *.sh
```

---

## 🗂️ Estrutura esperada do projeto

```
.
├── backup.sh
├── docker-compose.yml
├── minecraft-data/         # Dados persistentes do servidor
├── playit/                 # Configuração gerada do agente Playit
├── plugins/                # Seus plugins personalizados (.jar)
├── sync-plugins.sh
├── start.sh
├── stop.sh
└── backups/                # Backups gerados
```

---

## 💬 Dicas e Extras

- Para suporte a plugins, edite no `docker-compose.yml`:
  
```yaml
minecraft:
  environment:
    TYPE: PAPER
```

- Isso permite usar plugins como:
  - [GeyserMC](https://geysermc.org/) – para conexões Bedrock
  - [Floodgate](https://github.com/GeyserMC/Floodgate) – para login sem conta Java

### ➕ Como adicionar plugins

Para usar plugins no seu servidor (com `TYPE: PAPER` no `docker-compose.yml`), você pode:

1. Copiar os arquivos `.jar` dos plugins para a pasta `plugins/` na raiz do projeto e rodar:

```bash
./sync-plugins.sh
```

2. Ou colocar os arquivos `.jar` diretamente dentro da pasta `minecraft-data/plugins/`

Ambas as formas funcionam e garantem que os plugins estarão ativos no servidor após o start.

Usar a pasta `plugins/` + script ajuda na organização e controle dos plugins.

---

✅ Seu servidor estará pronto para amigos entrarem — mesmo sem IP fixo ou redirecionamento de portas!
