FROM python:3.10-slim-bookworm

WORKDIR /app
COPY . /app

# Install required tools + AWS CLI
RUN apt-get update -y && apt-get install -y curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# Install other dependencies + Python libs
RUN apt-get update -y && apt-get install -y ffmpeg libsm6 libxext6 unzip \
    && pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
