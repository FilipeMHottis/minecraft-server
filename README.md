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
6. Tornar os scripts executáveis
```bash
chmod +x *.sh
```

7. Execulte o docker-compose
```bash
./start.sh
```

8. Criar os túneis no Playit.gg:

- Para Minecraft Java:

  - **Service type:** Minecraft Java Edition (Game)  
  - **Local port:** 25565 (porta padrão do Minecraft Java)  
  - **Name:** (Opcional, para identificar o túnel)

- Caso use o plugin GeyserMC, também crie um túnel para Minecraft Bedrock:

  - **Service type:** Minecraft Bedrock Edition (Game)  
  - **Local port:** 19132 (porta padrão do Minecraft Bedrock)  
  - **Name:** (Opcional)

**Observação:** A porta 19132 já vem aberta por padrão no container, mas é necessário criar o túnel para que o Playit faça o redirecionamento corretamente.

9. Salve o túnel. O Playit vai gerar um endereço público (tipo `abc123.playit.gg`) que seus amigos poderão usar para entrar no seu servidor!

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

## 🛠️ Comandos úteis para gerenciamento

### 📜 Verificar os logs do servidor

Use este comando para verificar se o servidor iniciou corretamente:

```bash
docker logs -f minecraft
```

Isso mostra os logs em tempo real. Para sair, pressione Ctrl+C.

Se quiser ver apenas as últimas linhas:

```bash
docker logs --tail 50 minecraft
```

### 💬 Enviar comandos diretamente ao servidor (via RCON)

Se o `ENABLE_RCON` estiver ativado no `docker-compose.yml`, você pode usar o `rcon-cli` para enviar comandos ao servidor Minecraft:

```bash
docker exec -i minecraft rcon-cli
```

Depois de rodar esse comando, você verá um prompt como este:

```
>
```

Agora digite comandos do Minecraft, como:

```bash
>say Servidor online!
>gamemode creative SeuNick
>list
```

> Para sair do prompt, pressione `Ctrl+C`.

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
