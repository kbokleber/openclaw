# TOOLS.md - Nexus Local Notes

Skills definem _como_ as ferramentas funcionam. Este arquivo é para detalhes específicos do Nexus.

---

## IDs / Nomes
- **Agent id (Nexus):** `nexus`

---

## 🔗 n8n Configuration (CRÍTICO)

- **Host:** https://n8nh.kbosolucoes.com.br
- **API Key:** Armazenada em `.secure/n8n-credentials.json` (não commitar!)
- **Skill:** `/data/workspace/agent-nexus/skills/n8n/`

### Persistência das Credenciais
⚠️ **NUNCA perder este arquivo:** `n8n-credentials.json` contém a API key de acesso ao n8n do Kleber. **Sem ela, perde acesso a todas as automações.**

**Backup sugerido:**
- O arquivo está em `.secure/` (não versionado no git)
- Manter cópia em local seguro externamente

**Se perder as credenciais:**
1. Acessar console do n8n: https://n8nh.kbosolucoes.com.br
2. Settings → API → Regenerate API Key
3. Atualizar `.secure/n8n-credentials.json`

### Setup inicial
```bash
# Exportar credenciais antes de usar
export $(cat /data/workspace/agent-nexus/.secure/n8n-credentials.json | jq -r 'to_entries | .[] | "\(.key)=\(.value)"')
```

### Comandos úteis
```bash
# Listar workflows
/data/workspace/agent-nexus/skills/n8n/scripts/n8n_api.py workflows list

# Ativar workflow
/data/workspace/agent-nexus/skills/n8n/scripts/n8n_api.py workflows activate <id>

# Desativar workflow
/data/workspace/agent-nexus/skills/n8n/scripts/n8n_api.py workflows deactivate <id>

# Executar workflow
/data/workspace/agent-nexus/skills/n8n/scripts/n8n_api.py workflows execute <id>

# Ver detalhes do workflow
/data/workspace/agent-nexus/skills/n8n/scripts/n8n_api.py workflows get <id>
```

---

## 🐙 Git Configuration (CRÍTICO - NUNCA PERDER!)

- **User:** Kleber Bueno <kbosolucoes@gmail.com>
- **GitHub:** https://github.com/kbokleber
- **Username:** `kbokleber`
- **Default Branch:** main
- **SSH Key:** `.secure/ssh/id_ed25519` (ED25519)
- **SSH Public Key:** `.secure/ssh/id_ed25519.pub`

### 🔐 Chaves SSH - Persistência OBRIGATÓRIA
⚠️ **NUNCA perder estes arquivos:** `.secure/ssh/id_ed25519` (PRIVADA!)  
Sem as chaves SSH **não há acesso ao GitHub** — perde acesso a todos os repositórios.

**Setup SSH (obrigatório antes de usar Git):**
```bash
# 1. Copiar chaves para ~/.ssh/
mkdir -p ~/.ssh
cp /data/workspace/agent-nexus/.secure/ssh/id_ed25519* ~/.ssh/
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# 2. Configurar git
git config --global user.name "Kleber Bueno"
git config --global user.email "kbosolucoes@gmail.com"
git config --global init.defaultBranch main

# 3. Testar conexão
ssh -T git@github.com
```

**Adicionar chave ao GitHub (se necessário):**
```bash
cat /data/workspace/agent-nexus/.secure/ssh/id_ed25519.pub
# Copiar e colar em: GitHub → Settings → SSH and GPG keys → New SSH key
```

---

## 📦 Repositório openclaw (CONFIGURAÇÕES DOS AGENTES)

**URL:** https://github.com/kbokleber/openclaw  
**Clone:** `git@github.com:kbokleber/openclaw.git`  
**Branch:** main

**O que contém:**
- Configuração completa do Nexus (SOUL, MEMORY, TOOLS, etc.)
- Skills instaladas (n8n)
- Documentação dos agentes

**⚠️ ATENÇÃO:** Arquivos em `.secure/` (credenciais, SSH keys) **NÃO ESTÃO NO REPO** por segurança.

**Para restaurar ambiente:**
```bash
# 1. Clonar repo
git clone git@github.com:kbokleber/openclaw.git

# 2. Copiar chaves e credenciais manualmente (de backup externo)
# - .secure/ssh/id_ed25519
# - .secure/ssh/id_ed25519.pub
# - .secure/n8n-credentials.json
```

---

## O que colocar aqui

- Nomes de câmeras e localizações
- Hosts SSH e aliases
- Vozes preferidas para TTS
- Nomes de dispositivos
- Qualquer coisa específica do ambiente

---

_This is your cheat sheet._
