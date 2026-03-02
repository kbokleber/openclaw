# MEMORY.md

## Nexus - Recuperado em 02/03/2026
- **Status:** Ativo e configurado
- **Função:** Agente auxiliar do Kleber
- **Workspace:** `/data/workspace/agent-nexus/`

## Responsabilidades
- Auxiliar em tarefas quando solicitado
- Manter memórias e contexto separado da Victoria
- Conectar informações entre diferentes fontes quando necessário
- **Gerenciar workflows do n8n** — listar, ativar, executar automações

## 🔗 n8n - Configurado em 02/03/2026 (CRÍTICO - NUNCA PERDER)
- **Host:** https://n8nh.kbosolucoes.com.br
- **Skill:** `/data/workspace/agent-nexus/skills/n8n/`
- **Comandos:** Ver TOOLS.md na seção "n8n Configuration"

### 🔐 Credenciais (Persistência OBRIGATÓRIA)
**Status:** ✅ Configurado em 02/03/2026  
**Local:** `.secure/n8n-credentials.json` (PERMANTENTE)

**⚠️ IMPORTANTE:** As credenciais do n8n **NÃO PODEM SER PERDIDAS**. Sem elas, perde-se acesso a:
- 35 workflows do Kleber
- 14 automações ativas (Em KBO Soluções, Imóveis, Chat, Jurídico, etc.)
- Integrações com Chatwoot, Drive, Evolution API

**Se precisar recuperar:**
1. Verificar `.secure/n8n-credentials.json`
2. Se ausente, verificar backup manual ou reconfigurar via console do n8n

---

## 🐙 Git - Configurado em 02/03/2026 (CRÍTICO - NUNCA PERDER)
- **User:** Kleber Bueno <kbosolucoes@gmail.com>
- **GitHub:** https://github.com/kbokleber
- **Repositórios:** https://github.com/kbokleber?tab=repositories
- **Username:** `kbokleber`
- **SSH Keys:** `.secure/ssh/` — ED2559
- **Public Key:** `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA+m2z9m31IK3gRefQw0eVckk7kkS874VJdu64YKrUf7 kbosolucoes@gmail.com`

### 🔐 Chaves SSH (Persistência OBRIGATÓRIA)
**Status:** ✅ Configurado em 02/03/2026
**Local:** `.secure/ssh/id_ed25519` (PRIVADA - nunca perder!)

**⚠️ IMPORTANTE:** Sem as chaves SSH, Nexus **não consegue**:
- Fazer push/pull em repositórios
- Clonar/codar em projetos do Kleber
- Fazer deploy automático

**Configurando o Git:**
```bash
# Copiar chaves SSH
mkdir -p ~/.ssh
cp /data/workspace/agent-nexus/.secure/ssh/id_ed25519* ~/.ssh/
chmod 600 ~/.ssh/id_ed25519

# Configurar git
git config --global user.name "Kleber Bueno"
git config --global user.email "kbosolucoes@gmail.com"
git config --global init.defaultBranch main
```

**Adicionar ao GitHub (se necessário):**
1. Copiar public key: `cat ~/.ssh/id_ed25519.pub`
2. GitHub → Settings → SSH and GPG keys → New SSH key
