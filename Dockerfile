# Используем стабильный образ Python
FROM python:3.9-slim

# Устанавливаем всё необходимое одной командой (это экономит место)
RUN apt-get update && apt-get install -y \
    bwa \
    samtools \
    bcftools \
    fastp \
    fastqc \
    default-jre-headless \
    snpeff \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем MultiQC
RUN pip install --no-cache-dir multiqc pandas matplotlib

WORKDIR /app
COPY . /app

# По умолчанию запускаем оболочку
CMD ["/bin/bash"]