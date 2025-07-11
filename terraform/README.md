# ☁️ Pi-hole Client on Azure App Service (Terraform)

This Terraform project deploys a Pi-hole to **Azure App Service for Linux**
using a Docker container. The infrastructure is managed using
**Azure Verified Modules (AVM)**.

> ⚠️ Note:
> - Due to Azure App Service restrictions, DNS filtering will **not** work (port 53 is not supported).
> - This deployment is intended for:
>   - UI demonstration or administrative interface preview
>   - HTTP/HTTPS-based access testing in public network environments (not self-signed or internal-only)
>   - Proxy-style scenarios (e.g., remote UI forwarding)

It is **not suitable for production DNS use** or local network filtering.

## 📦 What This Deploys

- **Resource Group**
- **Linux App Service Plan** (F1 – Free Tier by default)
- **App Service (Web App for Containers)** running the `pihole/pihole` Docker image

## 🚀 Quick Start

### 1. Azure Login (Interactive / Azure CLI)

If you're working locally with an Azure account that has appropriate permissions,
you can authenticate using the Azure CLI:

```powershell
az login
az account set --subscription "<your-subscription-id>"
```

### 2. Set Required Environment Variables (PowerShell)

> These are required for Terraform to authenticate with Azure using a service principal.

```powershell
$Env:ARM_SUBSCRIPTION_ID = "<your-subscription-id>"
```

### 3. Initialize and apply

```powershell
terraform init
terraform apply
```

## ⚙️ Input Variables

| Name             | Description                          | Example                  |
| ---------------- | ------------------------------------ | ------------------------ |
| `location`       | Azure region to deploy into          | `"japaneast"`            |
| `timezone`       | Time zone setting for Pi-hole        | `"Asia/Tokyo"`           |
| `password`       | Password for the Pi-hole API         | `"your_secure_password"` |
| `environment`    | Deployment environment tag           | `"dev"`                  |
| `ip_restriction` | IP restriction rules for App Service | see example below        |

You can define these in a `terraform.tfvars` file.

## 🔐 IP Restriction Example

You can restrict access to the App Service by specifying IP address rules via the `ip_restriction` variable.

```hcl
ip_restriction = {
  allow_admin = {
    action     = "Allow"
    priority   = 100
    name       = "AllowSpecificIP"
    ip_address = "203.0.113.10"
  }
}
```

## 🧠 Important Notes

- App Service only supports ports 80/443. **Pi-hole DNS functions on port 53
  (UDP/TCP)** cannot be used here.

- This deployment is best suited for **UI testing or proxying Pi-hole frontends**,
  not full DNS filtering.

## 📁 Modules Used

- [Azure/naming/azurerm](https://registry.terraform.io/modules/Azure/naming/azurerm)
- [Azure/avm-res-resources-resourcegroup/azurerm](https://registry.terraform.io/modules/Azure/avm-res-resources-resourcegroup/azurerm)
- [Azure/avm-res-web-serverfarm/azurerm](https://registry.terraform.io/modules/Azure/avm-res-web-serverfarm/azurerm)
- [Azure/avm-res-web-site/azurerm](https://registry.terraform.io/modules/Azure/avm-res-web-site/azurerm)

## 🧹 Cleanup

```powershell
terraform destroy -auto-approve
```
