# Mock API Server

A lightweight mock API server written in Dart, ideal for testing front-end or
integration with a Pi-hole-like API.

## 🛠 How to Run

### ▶️ Local Development

```bash
dart pub get
dart run bin/server.dart [--host 0.0.0.0] [--delay 300] [--fail stats] \
[--max-fail 3]
```

#### Options

| Option       | Description                                  | Default     |
| ------------ | -------------------------------------------- | ----------- |
| `--host`     | Server bind address (`localhost`, `0.0.0.0`) | `localhost` |
| `--delay`    | Response delay in milliseconds               | `500`       |
| `--fail`     | Endpoints that return HTTP 500 (see below)   | none        |
| `--max-fail` | Times each path fails before it works again  | always fail |

> Example:
> `dart run bin/server.dart --host 0.0.0.0 --delay 300`

#### Reproducing load errors (`--fail`)

Pass a comma-separated list to see how the app shows a failed data load.

| Screen                 | v6 target                  | v5 target            |
| ---------------------- | -------------------------- | -------------------- |
| Home tiles, Statistics | `stats`                    | `topItems`           |
| Home charts            | `history`                  | `overTimeData10mins` |
| Query logs             | `queries`                  | `getAllQueries`      |
| Domains                | `domains`                  | `list`               |
| Adlists                | `lists`                    | -                    |
| Clients / Groups       | `clients` / `groups`       | -                    |
| DHCP / Network         | `dhcp` / `network/devices` | -                    |
| Sessions               | `auth/sessions`            | -                    |
| Server info            | `info`                     | `versions`           |

> Example:
> `dart run bin/server.dart --fail stats,history,queries,domains,lists`

#### Checking recovery from errors (`--max-fail`)

Add `--max-fail N` to make each path fail `N` times and then return normal data.

## 🧱 Build for ARM64 (Linux)

Build a **native ARM64 executable** using Docker Buildx.

> Output binary will be located at `./out/mock_api_server`

### 🪟 PowerShell (Windows)

```pwsh
docker buildx build `
  --platform linux/arm64 `
  --output type=local,dest=./out `
  -t mock_api_server:arm64 `
  .
```

### 🐧 Bash (Linux / WSL)

```bash
docker buildx create --use  # Only needed once
docker buildx build --platform linux/arm64 \
  -t mock_api_server:arm64 \
  --output type=local,dest=./out \
  .
```

## ✅ Run the ARM64 Binary (on Raspberry Pi or ARM64 Linux)

```bash
chmod +x ./out/mock_api_server
./out/mock_api_server --host 0.0.0.0 --delay 200
```

> Make sure your Raspberry Pi OS is 64-bit (check with `uname -m` should be `aarch64`)

## 📂 API Endpoints

The server mounts the following routes:

```txt
/api/auth
/api/action
/api/dns
/api/domains
/api/groups
/api/history
/api/info
/api/lists
/api/queries
/api/padd
/api/stats
/api/network
/api/config
```

Each endpoint is defined in its own handler under `lib/handlers/`.
