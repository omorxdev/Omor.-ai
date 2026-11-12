# DEVELOPER OMOR AI — Android starter

A Flutter-first Android AI assistant starter. It intentionally has **no user login / registration screen**.

## Included in this starter
- Premium dark Flutter shell with Chat, Voice, Tools and Settings tabs
- Chat UI with streaming-ready message model
- Voice screen UI (microphone integration is a next implementation step)
- Secure local storage dependency for device-side settings
- Backend API client skeleton (AI keys stay on the server, never in the APK)
- Owner unlock client that calls a server endpoint; the secret is NOT hard-coded here
- Initial PostgreSQL schema for conversations, messages, owner devices and audit events
- Security and QA checklist

## Important security note
The previously displayed example code must be considered public because it appeared in chat. Do not use it as a real credential. Create a new, high-entropy owner secret and configure it only as a server-side secret. The app sends it over HTTPS to `/v1/owner/unlock`; the server should hash/verify it, rate-limit attempts, bind the resulting short-lived owner token to a device, and support revocation. No login system is included, but a shared secret alone cannot prove identity if it is copied.

## Run
1. Install Flutter stable and Android SDK.
2. From this folder run:
   ```bash
   flutter create .
   flutter pub get
   flutter run
   ```
3. Configure your backend base URL using `--dart-define=API_BASE_URL=https://your-api.example`.
4. Implement the backend endpoints documented in `docs/API_CONTRACT.md` before enabling real AI requests.

## Not yet production complete
This is a starter scaffold, not a tested release APK. Voice capture, real-time audio streaming, model routing, server endpoints, migrations, RLS/authorization review, automated tests and Play Store signing still need implementation and testing.


## Build an installable APK using GitHub Actions

This repository includes `.github/workflows/android-apk.yml`. To build:
1. Upload this project folder to a new GitHub repository (or push it to an existing repository's `main` branch).
2. Open the repository's **Actions** tab.
3. Select **Build Android APK** and press **Run workflow** (or wait for the push build).
4. Open the completed workflow run and download the artifact named `developer-omor-ai-release-apk`.
5. Extract the artifact ZIP and install `app-release.apk` on your Android phone. If Android asks, allow installation from that source.

**Important:** This workflow packages the current starter scaffold into an installable APK. It does not magically add a live AI backend. The chat UI is currently a starter/demo, voice features and server endpoints still need implementation, and a production-ready owner unlock must be configured securely. Do not embed API keys or the previously exposed sample unlock code in the app.
