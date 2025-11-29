FROM python:3.10-slim-bookworm

WORKDIR /app
COPY . /app

# Install AWS CLI manually (safe for all images)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# Install OS deps + Python libs
RUN apt update -y && apt install ffmpeg libsm6 libxext6 unzip -y \
    && pip install -r requirements.txt
    
CMD ["python3", "app.py"]
