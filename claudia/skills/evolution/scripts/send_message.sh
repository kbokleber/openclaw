#!/bin/bash
# Send WhatsApp message via Evolution API

CRED_FILE="/data/workspace/agent-claudia/.secure/evolution-credentials.json"

if [ ! -f "$CRED_FILE" ]; then
    echo "Error: Credentials not found at $CRED_FILE" >&2
    exit 1
fi

# Load credentials
EVOLUTION_HOST=$(jq -r '.EVOLUTION_HOST' "$CRED_FILE")
EVOLUTION_INSTANCE=$(jq -r '.EVOLUTION_INSTANCE' "$CRED_FILE")
EVOLUTION_API_KEY=$(jq -r '.EVOLUTION_API_KEY' "$CRED_FILE")

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <number> <message>"
    echo "  number: Full number with country code (e.g., 5511999999999)"
    echo "  message: Text message to send"
    exit 1
fi

NUMBER="$1"
MESSAGE="$2"

# Send message (Evolution API uses 'apikey' header, not 'Authorization: Bearer')
curl -s -X POST "${EVOLUTION_HOST}/message/sendText/${EVOLUTION_INSTANCE}" \
    -H "apikey: ${EVOLUTION_API_KEY}" \
    -H "Content-Type: application/json" \
    -d "{
        \"number\": \"${NUMBER}\",
        \"text\": \"${MESSAGE}\"
    }" | jq -r '.key.remoteJid // "✅ Message sent"'
