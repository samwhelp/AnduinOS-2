# APT Bootstrap

These files are injected into the chroot after debootstrap to enable access
to the AnduinOS APKG package server.

## Files

- **anduinos-archive-keyring.gpg** — GPG public key for verifying the APKG
  server's Release signatures. Copied from the source of truth:
  `../anduinos-packages/anduinos-archive-keyring/deploy/anduinos-archive-keyring.gpg`
- **anduinos.sources.template** — deb822 APT sources file with placeholders.
  `__APKG_SERVER__` and `__TARGET_SUITE__` are substituted by `setup_apt`.

## Updating the keyring

When the APKG signing key is rotated:

```bash
cp ../anduinos-packages/anduinos-archive-keyring/deploy/anduinos-archive-keyring.gpg .
```
