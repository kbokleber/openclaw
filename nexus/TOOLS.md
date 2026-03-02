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

## 🐙 Git Configuration

- **User:** Kleber Bueno <kbosolucoes@gmail.com>
- **GitHub:** https://github.com/kbokleber
- **Repositórios:** https://github.com/kbokleber?tab=repositories
- **Username:** `kbokleber`
- **Default Branch:** main
- **SSH Key:** `.secure/ssh/id_ed25519` (ED25519)
- **SSH Public Key:** `.secure/ssh/id_ed25519.pub`

### 🔐 Persistência das Chaves SSH
⚠️ **NUNCA perder estes arquivos:** As chaves SSH em `.secure/ssh/` permitem acesso aos repositórios Git do Kleber.

**Setup SSH:**
```bash
# Copiar chaves para ~/.ssh/
cp /data/workspace/agent-nexus/.secure/ssh/id_ed25519* ~/.ssh/
chmod 600 ~/.ssh/id_ed25519

# Testar conexão
ssh -T git@github.com
```

**Adicionar chave ao GitHub:**
```bash
# Copiar public key
cat /data/workspace/agent-nexus/.secure/ssh/id_ed25519.pub
# Colar em: GitHub → Settings → SSH and GPG keys → New SSH key
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
