FROM python:3.11-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y samtools

# Устанавливаем Python-библиотеки
RUN pip install biopython pandas

# Настраиваем рабочую папку и копируем код
WORKDIR /app
COPY analyze.py .

# Запускаем скрипт
CMD ["python", "analyze.py"]