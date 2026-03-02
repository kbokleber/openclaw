# TOOLS.md - ClaudIA Local Notes

Configurações específicas da ClaudIA para atendimento NK Imóveis.

---

## IDs / Nomes
- **Agent id (ClaudIA):** `claudia`
- **Empresa:** NK Imóveis

---

## 🟢 WhatsApp (Evolution API) - CRÍTICO

**Integração:** Via Evolution API conectada ao n8n
- **Host:** https://n8nh.kbosolucoes.com.br (gerenciado pelo Nexus)
- **Instância:** Configurada em `.secure/evolution-credentials.json`
- **Canal:** WhatsApp Business

### 🔐 Credenciais (NUNCA commitar!)
**Local:** `.secure/evolution-credentials.json`
**Contém:** API key, nome da instância, número do WhatsApp

### Setup inicial
```bash
# Exportar credenciais
export $(cat /data/workspace/agent-claudia/.secure/evolution-credentials.json | jq -r 'to_entries | .[] | "\(.key)=\(.value)"')
```

### Comandos úteis

**Enviar mensagem diretamente (ClaudIA):**
```bash
# Usando script (recomendado)
/data/workspace/agent-claudia/skills/evolution/scripts/send_message.sh \
  "5513999999999" \
  "Olá, sou ClaudIA da NK Imóveis!"

# Via curl direto (Evolution usa header 'apikey', não 'Authorization')
curl -s -X POST "https://evo.kbosolucoes.com.br/message/sendText/kbosolucoes" \
    -H "apikey: 8DB4D74D75A8-4850-..." \
    -H "Content-Type: application/json" \
    -d '{"number": "5513999999999", "text": "..."}'
```

**⚠️ IMPORTANTE:** Evolution API usa header `apikey` (não `Authorization: Bearer`)!

**Para operações complexas (via n8n):**
```
/spawn nexus
Envie mensagem Whats via n8n para [número]: [mensagem]
```

---

## ⚠️ Isolamento de Segurança

**ClaudIA NÃO COMPARTILHA credenciais com:**
- ❌ Victoria (agente principal)
- ❌ Outros agentes
- ❌ Repositório git público (openclaw)

**Acesso permitido:**
- ✅ Nexus (para integrações n8n, quando necessário)
- ✅ Seu próprio workspace isolado

---

## Atendimento NK Imóveis

### Horário comercial
- Seg-Sex: 09:00 - 18:00
- Sáb: 09:00 - 12:00
- Dom/Feriados: Sem atendimento (a menos que seja emergência)

### Pautas permitidas
- ✅ Informações sobre imóveis
- ✅ Agendamento de visitas
- ✅ Esclarecimento de documentação
- ✅ Status de propostas
- ✅ Encaminhamento para corretor

### Encaminhar para humano quando
- Proposta oficial
- Negociação de valores
- Dúvidas complexas de documentação
- Reclamações

---

_This is your cheat sheet._
