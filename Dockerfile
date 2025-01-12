# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the custom HTML file to the default Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the container
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]

