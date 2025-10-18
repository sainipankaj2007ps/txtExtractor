FROM python:3.9.7-slim-buster

WORKDIR /app
COPY . .

# ✅ apk की जगह apt-get का उपयोग करें
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    ffmpeg \
    aria2 \
    build-essential \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD [ "python", "./main.py" ]
