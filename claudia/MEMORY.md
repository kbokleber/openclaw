# MEMORY.md - ClaudIA

## ClaudIA - NK Imóveis
- **Criada em:** 02/03/2026
- **Status:** Ativa
- **Função:** Atendimento WhatsApp NK Imóveis
- **Workspace:** `/data/workspace/agent-claudia/`

## 🟢 WhatsApp - Configurado em 02/03/2026 (CRÍTICO - NUNCA PERDER)
**Status:** ✅ **COMPLETO** ✅  
**Integração:** Evolution API  
**Canal:** WhatsApp Business (5513996502516)  
**Local credenciais:** `.secure/evolution-credentials.json`

### Credenciais Configuradas ✅
- **Host:** https://evo.kbosolucoes.com.br
- **Instância:** kbosolucoes
- **Número:** 5513996502516
- **API Key:** [Protegida em .secure/]

### ⚠️ IMPORTANTE
As credenciais do WhatsApp **NÃO PODEM SER PERDIDAS**.  
Sem elas:
- ❌ Perde acesso ao atendimento WhatsApp
- ❌ Não consegue enviar/receber mensagens
- ❌ Perde conexão com clientes da NK Imóveis

**Se precisar recuperar:**
1. Verificar `.secure/evolution-credentials.json`
2. Se ausente, reconfigurar via Evolution API
3. Ou regenerar instância no Evolution

### 🔐 Isolamento de Segurança
- **Apenas ClaudIA** acessa estas credenciais
- **Victoria** NÃO TEM ACESSO a este workspace
- **Nexus** pode auxiliar em integrações n8n (se necessário)

---

## Scripts Disponíveis

**Enviar mensagem WhatsApp:**
```bash
/data/workspace/agent-claudia/skills/evolution/scripts/send_message.sh \
  "5513999999999" \
  "Olá, sou ClaudIA da NK Imóveis! Como posso ajudar?"
```

**Consultar status:**
```bash
source /data/workspace/agent-claudia/.secure/evolution-credentials.json
curl -s "${EVOLUTION_HOST}/instance/connectionState/${EVOLUTION_INSTANCE}" \
    -H "Authorization: Bearer ${EVOLUTION_API_KEY}"
```

---

## NK Imóveis
Imobiliária especializada em atendimento de qualidade.

### Responsável
- **Kleber Bueno** - Proprietário/Gestor

### Histórico de atendimento
_(Será preenchido conforme interações)_
