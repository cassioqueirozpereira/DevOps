# Dockerfile para aplicação FastAPI
FROM python:3.13.5-alpine3.22

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários
COPY requirements.txt .
COPY app.py .
COPY database.py .
COPY models.py .
COPY schemas.py .
COPY escola.db .
COPY routers/ ./routers/

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta padrão do Uvicorn
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
