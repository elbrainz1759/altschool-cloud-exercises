
# AltSchool Second Semester Exam Project 

##  Project Overview

This project demonstrates the provisioning of a cloud server, setup of a modern web stack, and deployment of a professional dynamic landing page for showcasing cloud engineering skills. The site is hosted on an AWS EC2 instance with Nginx as a reverse proxy for a Node.js application.

---

##  Live Demo

- **Subdomain:** [https://altschool.agehjeremiah.com](https://altschool.agehjeremiah.com) – SSL Installed

- **Public IP:** [http://13.221.240.132:3000](http://13.221.240.132:3000) - No SSL 



---

## Screenshots

**EC2 instance setup with Ubuntu OS** 
![ec2_first](images/ec2_first.png)

**Security group configuration (HTTP, HTTPS, SSH)** 
![ec2](images/ec2.png)

**Made PEM key read-only for SSH** 
![chmod](images/chmod.png)

**Successfully connected to the server via SSH** 
![ssh](images/ssh.png)

**Nginx default landing page working** 
![nginx](images/nginx.png)

**Node.js installed and running on port 3000** 
![node](images/node.png)

**Reverse proxy configured in Nginx** 
![nginx_conf](images/nginx_conf.png)

**EC2 IP redirects to port 3000 via Nginx** 
![node2](images/node2.png)

**Subdomain configured via Route 53** 
![subdomain](images/subdomain.png)

**Let’s Encrypt SSL successfully applied** 
![ssl](images/ssl.png)

**PM2 used for managing the Node.js app** 
![pm2](images/pm2.png)

**Live landing page screenshot (1)** 
![site1](images/site1.png)

**Live landing page screenshot (2)** 
![site2](images/site2.png)

**Live landing page screenshot (3)** 
![site3](images/site3.png)

**Live landing page screenshot (4)** 
![site4](images/site4.png)

---

## Setup Steps

### 1. Provisioning EC2 Instance (Ubuntu)
- Created a new EC2 instance with Ubuntu 22.04.
- Generated a key pair and downloaded the `.pem` file.
- Set file permissions with `chmod 400`.

### 2. SSH Access
```bash
ssh -i ageh-key.pem ubuntu@13.221.240.132
```

### 3. Installed Nginx
```bash
sudo apt update
sudo apt install nginx -y
```

### 4. Installed Node.js
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```

### 5. Setup Node.js App
Created a basic Express app on port 3000:
```js
const express = require('express');
const app = express();
app.use(express.static('public'));
app.listen(3000, () => console.log('App running on port 3000'));
```

### 6. Setup Nginx as a Reverse Proxy
Edited `/etc/nginx/sites-available/default`:
```nginx
server {
  listen 80;
  server_name altschool.agehjeremiah.com;

  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}
```

Restarted Nginx:
```bash
sudo nginx -t
sudo systemctl restart nginx
```

### 7. Domain and SSL Setup
- Created subdomain on Route 53: `altschool.agehjeremiah.com`
- Installed Certbot:
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx
```

### 8. Installed PM2 for Node.js App Management
```bash
sudo npm install pm2 -g
pm2 start app.js
pm2 startup
pm2 save
```

---

## About Me

**Name:** Jeremiah Ageh  
**Role:** Lead Cloud Engineer  
**Project Title:** *The Future of AI-Powered Healthcare*

---

## ✅ Summary

This project highlights:

- Cloud provisioning and configuration on AWS.
- Linux server setup with secure SSH access.
- Full-stack deployment with Node.js, Nginx, and HTTPS.
- Real-time site hosting with domain and SSL.
- Monitoring with PM2.

---

For more information or to collaborate, visit: [altschool.agehjeremiah.com](https://altschool.agehjeremiah.com)
