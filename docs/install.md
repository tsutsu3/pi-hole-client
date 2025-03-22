## 📦 Installation Guide

### Linux

1. Download the `.deb` package from the [releases page](https://github.com/tsutsu3/pi-hole-client/releases).
2. Install it using:

   ```bash
   sudo dpkg -i PiHoleClient_<version>_Linux_amd64.deb
   ```

> [!NOTE]
> This application depends on certain system libraries such as **libsecret-1-0** and **libjsoncpp1**.
>
> If you run into issues, install them manually using:
>
> `sudo apt install libsecret-1-0 <libjsoncpp1 or libjsoncpp25>`

### Windows

1. Download the Windows installer from the [releases page](https://github.com/tsutsu3/pi-hole-client/releases).
2. Run the `.exe` installer and follow the instructions.

> [!NOTE]
> This application requires the **Visual C++ Redistributable (x64)** to run.
>
> If you see an error when launching the application (e.g. missing `MSVCP140.dll` or `VCRUNTIME140.dll`),
> it likely means the **Visual C++ Redistributable (x64)** is not installed on your system.
> You can download it from the official Microsoft website:
>
> 👉 [https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist)