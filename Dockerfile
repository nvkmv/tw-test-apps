# Используем официальный Python образ
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл с зависимостями в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все файлы в контейнер
COPY . .

# Указываем порт, который будет использовать приложение
EXPOSE 5000

# Команда для запуска Flask-приложения через Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

