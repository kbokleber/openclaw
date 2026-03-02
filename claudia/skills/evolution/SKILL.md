---
name: evolution
description: WhatsApp integration via Evolution API.
homepage: https://evolution-api.com/
metadata:
  openclaw:
    emoji: "🟢"
    requires:
      bins: ["curl", "jq"]
      env: ["EVOLUTION_API_KEY", "EVOLUTION_INSTANCE"]
    primaryEnv: "EVOLUTION_API_KEY"
---

# Evolution API - WhatsApp

Integração com WhatsApp via Evolution API (gerenciada via n8n).

## Environment

- `EVOLUTION_API_KEY` — API key da instância Evolution
- `EVOLUTION_INSTANCE` — Nome da instância (ex: "claudia-nk")
- `EVOLUTION_HOST` — URL do servidor (via n8n)

## Quick start

Enviar mensagem:
```bash
{baseDir}/scripts/send_message.sh "5511999999999" "Olá, sou ClaudIA da NK Imóveis!"
```

## Comandos

Ver status da conexão:
```bash
curl -s "$N8N_HOST/webhook/evolution/status" \
  -H "Authorization: Bearer $EVOLUTION_API_KEY"
```

Enviar mensagem de texto:
```bash
curl -s -X POST "$N8N_HOST/webhook/evolution/send" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $EVOLUTION_API_KEY" \
  -d '{"number": "5511999999999", "message": "..."}'
```

## Notas

- Evolution API é acessada **via n8n** (Nexus gerencia)
- ClaudIA delega operações WhatsApp ao n8n/evolution
- Toda comunicação é logada no n8n para auditoria
