docker --version
docker build -t devops-capstone:v1.0.0 .

# List docker images
docker images

# Run flask app
docker run -d -p 8000:80 devops-capstone:v1.0.0