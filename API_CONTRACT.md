# Backend API contract (to implement)

No user account or password login is required. The backend must still authorize owner-only actions.

## POST /v1/owner/unlock
Request: `{ "secret_code": "<new high-entropy secret>" }`
Success: `{ "owner_token": "<short-lived signed token>", "expires_in": 3600 }`
Requirements:
- HTTPS only; never log request body or secret.
- Store only a strong password hash (Argon2id preferred) server-side.
- Rate-limit by IP and device; exponential backoff and alerting.
- Bind token to a generated device ID; short expiry; revocation support.
- Return generic errors; constant-time secret verification.
- Rotate the secret if exposed.

## POST /v1/chat
Request: `{ "message": "...", "conversation_id": "optional-id" }`
Response: `{ "reply": "...", "conversation_id": "..." }`
Requirements:
- Provider API keys only on server.
- Enforce request quotas, input size limits, output limits and timeout.
- Validate tool calls server-side; require confirmation for external side effects.
- Redact secrets and personal data from logs.

## GET /v1/health
Return service health and version, without exposing secrets or internal configuration.
