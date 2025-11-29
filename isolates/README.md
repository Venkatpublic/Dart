# HTTPS server (Dart)

This repository contains a simple HTTPS server written in Dart: `https_server.dart`.

Instructions

- Generate a self-signed certificate and private key (OpenSSL):

```bash
openssl req -x509 -newkey rsa:4096 -nodes -keyout server_key.pem -out server_cert.pem -days 365 -subj "/CN=localhost"
```

- Run the server (from the project root):

```bash
dart run https_server.dart
```

The server listens on port `8443` by default. Use `curl -k` to connect while ignoring the self-signed cert warning:

```bash
curl -k https://localhost:8443/
```

You can also pass explicit paths for the certificate and key:

```bash
dart run https_server.dart ./path/to/server_cert.pem ./path/to/server_key.pem
```

Notes

- This is a local-development setup using a self-signed certificate. Do not use these certs in production.
- On first run, if the cert files are missing, the program will print the OpenSSL command to generate them.
