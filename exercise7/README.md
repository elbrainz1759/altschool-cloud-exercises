# CIS Ubuntu Guide

This guide provides a summary of Ubuntu practices based on the [CIS Ubuntu Linux Benchmark](https://www.cisecurity.org/). It includes some essential standards and practical implementation steps.

---

## Key CIS Standards for Ubuntu

1. **Account and Password Settings** – enforce strong password policies 
2. **SSH Configuration** – secure remote access 
3. **Service Management** – disable unnecessary services 
4. **Audit Logging** – track system activities 
5. **Filesystem & Boot Security** – protect critical system files and boot loader 
6. **System Updates** – ensure automatic security patching 
7. **Network Configuration** – minimize open ports and unnecessary protocols 

---

## How to Implement some Essential CIS Standards

### 1. Enforce Strong Password Policies
```bash
sudo apt install libpam-pwquality

echo "minlen = 14" | sudo tee -a /etc/security/pwquality.conf
echo "dcredit = -1 ucredit = -1 ocredit = -1 lcredit = -1" | sudo tee -a /etc/security/pwquality.conf

sudo sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
sudo sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   10/' /etc/login.defs
```

### 2. Harden SSH Configuration
```bash
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/^#*Protocol.*/Protocol 2/' /etc/ssh/sshd_config
echo "AllowUsers youruser" | sudo tee -a /etc/ssh/sshd_config

sudo systemctl reload sshd
```

### 3. Disable Unused Services
```bash
sudo systemctl list-unit-files --type=service --state=enabled
# Example: Disable Avahi
sudo systemctl disable --now avahi-daemon.service
```

### 4. Configure Audit Logging
```bash
sudo apt install auditd

sudo sed -i 's/^max_log_file_action =.*/max_log_file_action = ROTATE/' /etc/audit/auditd.conf

sudo bash -c 'cat <<EOF >> /etc/audit/rules.d/cis.rules
-w /etc/passwd -p wa -k identity
-w /etc/ssh/sshd_config -p wa -k ssh
EOF'

sudo systemctl restart auditd
```

### 5. Secure GRUB Boot Loader
```bash
sudo grub-mkpasswd-pbkdf2
# Copy the generated hash

sudo bash -c 'cat <<EOF >> /etc/grub.d/40_custom
set superusers="admin"
password_pbkdf2 admin <your-hash-here>
EOF'

sudo update-grub
```

---

## ⚙️ Automating with Ubuntu Security Guide (usg)
Ubuntu provides a tool to apply CIS benchmarks automatically.

### Install and Apply
```bash
sudo apt update
sudo apt install usg-benchmarks-1

sudo usg fix cis_level1_server
```
## References

- [CIS Ubuntu Benchmark](https://www.cisecurity.org/benchmark/ubuntu_linux)
- [Ubuntu Security Guide (usg)](https://ubuntu.com/security/certifications/docs/usg)
