# Security and quality checklist

- [ ] Replace the chat-exposed sample owner code; generate a new random secret.
- [ ] Verify owner unlock only on HTTPS backend; never store plaintext secret.
- [ ] Rate-limit unlock attempts and implement revocation.
- [ ] Keep all AI provider keys on backend; scan APK and repository for secrets.
- [ ] Add Android microphone permission rationale and runtime permission flow.
- [ ] Implement speech recognition start/stop/error handling and TTS interruption.
- [ ] Test Bangla and English speech on low-end Android devices.
- [ ] Add offline/error/retry states and request cancellation.
- [ ] Add unit tests for services and widget tests for navigation/chat.
- [ ] Add database policies and test cross-device data isolation.
- [ ] Add crash reporting with sensitive-data redaction.
- [ ] Test battery, memory, network loss, large chats and accessibility.
- [ ] Configure app signing and release build only after QA passes.
