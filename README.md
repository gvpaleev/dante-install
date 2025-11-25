# Dante SOCKS5 Proxy Installer

Scripts to install and manage Dante SOCKS5 proxy server on Debian/Ubuntu.

## Installation

```bash
sudo ./install.sh
```

Installs Dante server with PAM authentication on port 1080.

## User Management

Add user:
```bash
sudo ./addUser.sh <username> <password>
```

Remove user:
```bash
sudo ./delUser.sh <username>
```

## Configuration

- Config: `/etc/danted.conf`
- Users: `/etc/dante.passwd`
- Logs: `/var/log/socks.log`
