# Use the official Nginx image as the base
FROM nginx:alpine

# Copy your HTML files into the default Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 to the outside
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
