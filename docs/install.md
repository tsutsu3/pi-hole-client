# 📦 Installation Guide

## 🐧 Linux

1. Download the `.deb` package from the [releases page](https://github.com/tsutsu3/pi-hole-client/releases).
2. Install it using:

   ```bash
   sudo dpkg -i PiHoleClient_<version>_Linux_amd64.deb
   ```

> [!NOTE]
> This application depends on certain system libraries such as
> **libsecret-1-0** and **libjsoncpp1**.
>
> If you run into issues, install them manually using:
>
> `sudo apt install libsecret-1-0 <libjsoncpp1 or libjsoncpp25>`

## 🪟 Windows Installation

### Option 1: Install from GitHub Releases

1. Download the Windows installer (`.exe`) from the [Releases page](https://github.com/tsutsu3/pi-hole-client/releases).
2. Run the downloaded installer and follow the on-screen instructions.

> [!NOTE]
> This application requires the **Visual C++ Redistributable (x64)** to run.
>
> If you encounter an error when launching the app (e.g., missing `MSVCP140.dll`
> or `VCRUNTIME140.dll`), it likely means the required Visual C++ Runtime is not
> installed on your system.
>
> 👉 You can download it from the official Microsoft website:
> <https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist>

### Option 2: Install via `winget`

If you have [Windows Package Manager](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
(`winget`) installed, you can install the app with a single command:

```powershell
winget install tsutsu3.Pi-hole-client
```
