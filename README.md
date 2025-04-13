# 🛠️ Jenkins CI/CD Pipeline with Docker & Tailscale in a Self-Hosted Homelab

This project demonstrates a **production-style Jenkins CI/CD pipeline** running entirely on a **self-hosted Ubuntu server (homelab)**. It uses **Docker** to containerize Jenkins, and **Tailscale** to securely expose the Jenkins web interface using a temporary **zero-trust tunnel**, perfect for demos and on-demand access.

---

## 📌 Project Goals

✅ Set up a local CI/CD pipeline using Jenkins inside Docker  
✅ Manage Jenkins data using Docker volumes  
✅ Securely access Jenkins from anywhere using Tailscale’s `funnel` feature  
✅ Follow real-world DevOps workflows (build, test, deliver)  
✅ Run this project entirely on a home server — no cloud services used!

---

## 🖥️ Architecture Overview


[GitHub Repo] --> [Jenkins Pipeline in Docker] --> [Build Flask App Image] --> [Docker Container] --> [Test Deployment]
                                                    ↓
                                       [Volume for persistent Jenkins data]
                                                    ↓
                                    [Tailscale Funnel exposes port 8080 securely]

🔧 Tech Stack
Tool            	Purpose
Jenkins	            CI/CD orchestration
Docker	            Containerization of Jenkins & apps
Tailscale	        Secure networking + public tunnel
Ubuntu Server	    Self-hosted environment (homelab)
Flask Web App	    Sample app to demonstrate CI/CD



🚀 How It Works
🐳 Jenkins is deployed inside Docker using a named volume for persistence.

🛠️ A GitHub repo triggers a Jenkins job that builds a Flask app Docker image.

🧪 Jenkins spins up the app container to validate the build.

🌐 When needed, tailscale funnel 8080 is used to temporarily expose Jenkins for demos or remote usage.

🔐 After usage, the tunnel is stopped to maintain privacy.



📦 Setup Instructions
📌 Assumes Docker, Docker Compose, and Tailscale are already installed.

> ⚠️ Prerequisites:
> - Ubuntu Server (or any Linux machine)
> - Docker & Docker Compose installed
> - Tailscale installed and authenticated

---



### 1. 🔁 Clone the Repository

```bash
git clone https://github.com/yourusername/jenkins-cicd-homelab.git
cd jenkins-cicd-homelab
```


---
### 2. 🐳 Start Jenkins using Docker Compose

```bash
docker-compose up -d
```


---
### 3. 🔐 Unlock Jenkins & Install Plugins
Visit Jenkins at: http://localhost:8080

Get the initial admin password:

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```


---
### 4. 📂 Create a Sample Jenkins Pipeline Job
Use the simple-webapp-flask GitHub repo or your own app repo.

Create a new Pipeline job.

Choose "Pipeline script from SCM" and use your GitHub repo.

Add a basic Jenkinsfile to your repo to build/test your app.


---
### 5. 🌐 Expose Jenkins Securely (Tailscale Funnel)
To share Jenkins publicly (e.g., for demos), run:

```bash
sudo tailscale funnel 8080
```


---
### 6. 🔁 Setup GitHub Webhook (for CI/CD)
Go to your GitHub repository.

Navigate to Settings > Webhooks > Add Webhook.

Use the URL from your Tailscale funnel (e.g., https://suyash.ts.net/github-webhook/)

Choose application/json as the content type.

Set the trigger to Just the push event.

Save the webhook.

✅ Now whenever you push code to GitHub, Jenkins will automatically trigger a build!


---
### 7. 🚀 Push Code Changes to Trigger Jenkins Job
Make changes to your app code or Jenkinsfile.

Push the changes to GitHub:

```bash
git add .
git commit -m "Update app"
git push
```

Watch the Jenkins console for your automated CI/CD pipeline in action!


---
### 8. ✅ Jenkins is Ready!
You now have a fully working self-hosted Jenkins CI/CD pipeline that:

✅ Runs in Docker

✅ Uses persistent volumes

✅ Is securely accessible from anywhere via Tailscale
---
