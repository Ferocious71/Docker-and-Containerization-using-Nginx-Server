# Dockerized Nginx with a Static HTML Page

## Overview
This project demonstrates the containerization of a simple HTML page using Nginx and Docker.

## Requirements:

1. Basic HTML Page:
   - Create a plain HTML page named `index.html` with some content (e.g., "Hello, Docker!").

2. Nginx Configuration:
   - Create an Nginx configuration file named `nginx.conf` that serves the `index.html` page.
   - Configure Nginx to listen on port 80.

3. Dockerfile:
   - Create a `Dockerfile` to define the Docker image.
   - Use an official Nginx base image.
   - Copy the `index.html` and `nginx.conf` files into the appropriate location in the container.
   - Ensure that the Nginx server is started when the container is run.

4. Building the Docker Image:
   - Build the Docker image using the `Dockerfile`.

5. Push the image on ECR
  - Make the public repository and push them on the ECR

## Files used in the Project - 
1. **index.html**: The static HTML page served by the Nginx server.
2. **nginx.conf**: Custom Nginx configuration to serve the `index.html`.
3. **Dockerfile**: Defines the Docker image for the project.

## To confiure AWS using CLI,building and pushing the Docker Image, peform below steps - 
1. aws configure (provide keys, secret access keys, region and formats)
2. aws sts get-caller-identity (to verify the user credentials of AWS)
3.	Create a Public ECR Repository:
aws ecr-public create-repository --repository-name sal-nginx-docker
4.	Authenticate Docker with ECR – 
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws 
    4.1	Retrieve a token and authenticate with Docker - Linux/Mac: ~/.docker/config.json
    4.2	Remove or comment out the "credsStore" or "credHelpers" line. Ensure the file looks like this:
    {
        "auths": {
            "public.ecr.aws": {}
        }
    }
    4.3	Then Retry the AWS ECR login.
5.	Once login is successful, run - sudo apt update, sudo apt upgrade -y.
6.	Install Docker as well. And run the below commands to build, tag and push the image.
    6.1	 docker build -t sal-nginx-docker .
    6.2	 docker tag sal-nginx-docker:latest public.ecr.aws/975050024946/sal-nginx-docker:latest 
    6.3	docker images
    6.4	docker run -d -p 8082:80 sal-nginx-docker (In browser, URL will work - http://localhost:8080)
    6.5	docker push public.ecr.aws/975050024946/sal-nginx-docker:latest	
8.	Once it is pushed successfully, the image will be pushed to the ECR repository.
9.	PFB sceenrshots from the AWS console for the ECR Registry Folder creation and dockerized image pushed to the folder.

   ![image](https://github.com/user-attachments/assets/2cc84cbf-b462-4f46-b5f7-3c8eb6ea8124)

   ![image](https://github.com/user-attachments/assets/6dc8273e-c1a9-4f18-b7ba-669ab33a064f)



