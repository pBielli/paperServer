#!/bin/bash

# Configurazione DuckDNS
DOMAIN="patbee"
VPN_DOMAIN="vpn-patbee"
TOKEN="3894523a-d53d-433d-b661-83ac156319fa"

# Funzione per aggiornare un dominio DuckDNS
updateDuckDDNS() {
  local domain=$1
  local token=$2

  # URL per aggiornare il dominio
  UPDATE_URL="https://www.duckdns.org/update?domains=$domain&token=$token&ip="

  # Aggiorna DuckDNS
  RESPONSE=$(curl -s "$UPDATE_URL")

  # Log per il controllo
  if [ "$RESPONSE" = "OK" ]; then
    echo "$(date) - DuckDNS ($domain) aggiornato con successo." >> ~/duckdns.log
  else
    echo "$(date) - Errore nell'aggiornamento di DuckDNS ($domain): $RESPONSE" >> ~/duckdns.log
  fi
}

# Aggiorna i domini configurati
updateDuckDDNS "$DOMAIN" "$TOKEN"
updateDuckDDNS "$VPN_DOMAIN" "$TOKEN"

# Mantieni il file di log sotto 1 MB
if [ $(stat -c%s ~/duckdns.log) -gt 1048576 ]; then
  > ~/duckdns.log
fi

