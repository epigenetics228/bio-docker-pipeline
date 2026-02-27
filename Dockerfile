# Используем базовый образ с Python
FROM python:3.9-slim

# Устанавливаем системные утилиты для биоинформатики 🧬
RUN apt-get update && apt-get install -y \
    bwa \
    samtools \
    bcftools \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем библиотеки Python, если они нужны для отчетов
RUN pip install pandas matplotlib

# Копируем наши скрипты
COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y fastqc

RUN apt-get update && apt-get install -y \
    bwa \
    samtools \
    bcftools \
    fastp \
    && rm -rf /var/lib/apt/lists/*