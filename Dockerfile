FROM python:3.6
#Copiando os arquivos do projeto para o diretorio usr/src/app 
COPY . /usr/src/app
#Definindo o diretorio onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
COPY requirements.txt ./
# Instalando os requerimentos com o PIP
#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
#pip install --no-cache-dir -r requirements.txt
RUN echo "nameserver 8.8.8.8" > temp-resolv.conf && \
    mv /etc/resolv.conf /etc/resolv.conf.bak && \
    mv temp-resolv.conf /etc/resolv.conf && \
    pip install --no-cache-dir -r requirements.txt && \
    mv /etc/resolv.conf.bak /etc/resolv.conf
# Expondo a porta da APP
EXPOSE 8000
# Executando o comando para subir a aplicacao
CMD ["gunicorn", "to_do.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
