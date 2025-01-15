<!-- markdownlint-disable MD013 -->
# CI/CD Secrets Management

This document provides instructions for securely storing and managing secrets
required for CI/CD workflows in GitHub Actions, specifically for integrating
with Google Cloud Platform (GCP) and handling encrypted files.

## 1️⃣ Required Secrets

The following secrets must be configured in
**GitHub Actions → Settings → Secrets and variables → Actions**:

| Secret Key              | Description                                                                                                                                |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `GCP_SERVICE_ACCOUNT`   | Service account email (e.g., `service-account@project-id.iam.gserviceaccount.com`)                                                         |
| `GCP_WORKLOAD_IDENTITY` | Workload Identity Provider ID (e.g., `projects/{project-number}/locations/global/workloadIdentityPools/{pool-id}/providers/{provider-id}`) |

The following secrets contain **encoded files** and must be stored as
**Base64-encoded strings**:

| Secret Key       | Description                                             |
| ---------------- | ------------------------------------------------------- |
| `ENV`            | `.env` file containing environment variables            |
| `KEYSTORE_JKS`   | Keystore file (`.jks`) for signing Android builds       |
| `KEY_PROPERTIES` | Key properties file (`key.properties`) for the keystore |

## 2️⃣ Using Workload Identity Federation through a Service Account

This project utilizes **Workload Identity Federation** to authenticate GitHub
Actions with Google Cloud without requiring a service account key file.

### **Setting Up Workload Identity Federation**

See [Workload Identity Federation through a Service Account](https://github.com/google-github-actions/auth?tab=readme-ov-file#workload-identity-federation-through-a-service-account).

Click `▶ Click here to display detailed instructions ...` to expand the
detailed setup instructions and follow the steps to complete the configuration.

## 3️⃣ Setting Up Configuration Files

### **.env File**

Copy `.env.sample` and modify its contents as needed:

```sh
cp .env.sample .env
```

Example `.env` file:

```ini
SENTRY_DSN=https://xxxxtest1234@o999999999999999.ingest.us.sentry.io/999999999999999
ENABLE_SENTRY=false
ENABLE_SENTRY_SCREENSHOTS=false
LOG_LEVEL=off
```

### **key.properties File**

The `storeFile` value must always be set to `keystore.jks` and should not be
changed. Ensure that the value remains consistent to avoid build errors.
Copy `key.properties.sample` and modify its contents as needed:

```sh
cp android/key.properties.sample key.properties
```

Example `key.properties` file:

```ini
storePassword=storepassword
keyPassword=keypassword
keyAlias=sample
storeFile=keystore.jks
```

## 4️⃣ Encoding and Storing Files as Secrets

For files that need to be stored in GitHub Secrets, they must be
**Base64-encoded** before adding them.

### **Encoding Files**

Run the following commands locally to encode your files:

```sh
base64 -w 0 .env > env.b64
base64 -w 0 keystore.jks > keystore.b64
base64 -w 0 key.properties > key.properties.b64
```

This generates Base64-encoded files
(`env.b64`, `keystore.b64`, `key.properties.b64`).
Copy the contents and add them to GitHub Secrets.

## Additional Resources

- [GitHub Actions Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Google Cloud Workload Identity Federation](https://cloud.google.com/iam/docs/workload-identity-federation)
- [r0adkll/upload-google-play](https://github.com/r0adkll/upload-google-play)
- [google-github-actions/auth](https://github.com/google-github-actions/auth)
