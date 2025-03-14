## 📦 Installation Guide

### Linux

1. Download the `.deb` package from the releases page.
2. Install it using:

   ```bash
   sudo dpkg -i PiHoleClient_<version>_Linux_amd64.deb
   ```

> [!CAUTION]
> If a version ≤ **v1.0.3** is installed, attempting to install a newer version
> may result in the following error:
>
> ```bash
> dpkg: warning: old piholeclient package post-removal script subprocess returned error exit status 2
> dpkg: trying script from the new package instead...
> dpkg (subprocess): unable to execute new piholeclient package post-removal script (/var/lib/dpkg/tmp.ci/postrm): No such file or directory
> dpkg: error processing archive PiHoleClient_1.0.3_Linux_amd64.deb (--install):
>  new piholeclient package post-removal script subprocess returned error exit status 2
> ```
>
> ### Resolution
>
> 1. Remove the problematic files:
>
>    ```bash
>    sudo rm /var/lib/dpkg/info/piholeclient.*
>    ```
>
> 2. Reinstall the package:
>
>    ```bash
>    sudo dpkg -i PiHoleClient_<version>_Linux_amd64.deb
>    ```
>
> This ensures `dpkg` does not attempt to execute the missing **post-removal script** and allows the installation to proceed.

### Windows

1. Download the Windows installer from the releases page.
2. Run the `.exe` installer and follow the instructions.
