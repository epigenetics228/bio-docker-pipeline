FROM python:3.9-slim

# Устанавливаем всё одной командой для стабильности
RUN apt-get update && apt-get install -y \
    bwa \
    samtools \
    bcftools \
    fastp \
    default-jre-headless \
    snpeff \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir multiqc

WORKDIR /app
COPY . /app