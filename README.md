# OpenClaw Agent Configs

Configurações dos agentes OpenClaw do Kleber.

## Estrutura

```
openclaw/
├── README.md
├── .gitignore
├── nexus/              # Agente Nexus (🔗 integrações)
│   ├── AGENTS.md
│   ├── SOUL.md
│   ├── IDENTITY.md
│   ├── USER.md
│   ├── MEMORY.md
│   ├── TOOLS.md
│   ├── HEARTBEAT.md
│   └── skills/
│       └── n8n/        # Skill n8n
└── victoria/           # Agente Victoria (futuro)
```

## ⚠️ IMPORTANTE: Credenciais

**Arquivos em `.secure/` NÃO SÃO COMMITADOS.**

Eles contêm:
- API keys (n8n, Google, etc.)
- Chaves SSH
- Tokens de acesso

Para usar em novo ambiente:
1. Clonar este repo
2. Restaurar manualmente:
   - `.secure/n8n-credentials.json`
   - `.secure/ssh/id_ed25519`
   - `.secure/ssh/id_ed25519.pub`
3. Verificar `TOOLS.md` em cada agente

## Configurado em

- 02/03/2026 — Nexus recuperado, n8n e Git integrados
