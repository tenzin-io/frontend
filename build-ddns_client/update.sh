#!/bin/bash
set -e

POLL=3600

while true
do

# Get my IP address
MY_IP=$(curl -s  http://checkip.dyndns.org/ | html2text | cut -d: -f2 | xargs -n1)

# Update my IP address
cat <<EOF | curl -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
              -H "Authorization: Bearer ${AUTH_TOKEN}" \
              -H "Content-Type: application/json" \
              --data-binary @- | jq
{
  "type": "A",
  "name": "${FRONTEND_DNS}",
  "content": "${MY_IP}",
  "ttl": 3600,
  "proxied": true
}
EOF

# Verify my DNS record
curl -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
              -H "Authorization: Bearer ${AUTH_TOKEN}" \
              -H "Content-Type: application/json" | jq

sleep $POLL
done
