#!/bin/bash
# Generate self-signed certificate for development

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout server.key \
  -out server.crt \
  -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:pihole.local,IP:127.0.0.1"

echo "Generated: server.crt and server.key"
