# Jenkins Demo App 🚀

This is a simple Node.js web app deployed using a CI/CD pipeline with:

- Jenkins
- Docker
- GitHub
- AWS EC2

## How it works
1. Push code to GitHub
2. GitHub Webhook triggers Jenkins
3. Jenkins builds a Docker image
4. Jenkins runs the container on EC2
5. Access the app at http://<EC2_PUBLIC_IP>/

## Default Response
