# Memo

## Development

To install locally, you need to change the permissions first.
The installation commands are as follows:

1. (Admin PowerShell): `winget settings --enable LocalManifestFiles`
2. (PowerShell): `winget install --manifest .\manifests\t\tsutsu3\Pi-hole-client\<version>`
3. (Admin PowerShell): `winget settings --disable LocalManifestFiles`

