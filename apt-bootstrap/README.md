# APT Bootstrap

The build downloads the GPG keyring from the APKG server at build time
and generates the APT sources file inline — no static seed files needed.

- **Keyring**: fetched from `$APKG_SERVER/artifacts/certs/$APKG_CERT_NAME`
  and dearmored into `/usr/share/keyrings/`
- **Sources**: generated from `APKG_SERVER` and `TARGET_UBUNTU_VERSION` in `setup_apt()`

Both variables are configured in `args.sh`.
