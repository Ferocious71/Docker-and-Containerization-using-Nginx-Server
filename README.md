# Dockerized Nginx with a Static HTML Page

## Overview
This project demonstrates the containerization of a simple HTML page using Nginx and Docker.

## Files
1. **index.html**: The static HTML page served by the Nginx server.
2. **nginx.conf**: Custom Nginx configuration to serve the `index.html`.
3. **Dockerfile**: Defines the Docker image for the project.

To confiure AWS using CLI,building and pushing the Docker Image, peform below steps - 
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

