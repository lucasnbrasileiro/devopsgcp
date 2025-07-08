# Use a imagem oficial do Python como base.  Especificamos a tag para garantir a versão.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requirements primeiro para aproveitar o cache do Docker.
COPY requirements.txt .
# Instala as dependências do Python. A opção --no-cache-dir reduz o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o contêiner.
COPY . .

# Expõe a porta que a aplicação usará.  Isso é mais para documentação.
EXPOSE 8000

# Define o comando para iniciar a aplicação usando Uvicorn.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload"]
