# README

### Setup:

1 - Suba o banco de dados para aplicação com o comando:

```sh
docker run --name db --network=rede -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```

2 - Crie uma rede com o comando:

```sh
docker network create -d bridge rede
```

3 - Faça um build da aplicação com o comando:           

```sh
docker build -t speedio_api:latest .
```

4 - Suba o container

```sh
docker run -d --network=rede -p 3000:3000 speedio_api
```

### Endereço da api: http://localhost:3000/api/v1

- Para listar as Urls cadastradas, execute o comando:
```sh
curl --location --request GET 'http://localhost:3000/api/v1/short_urls' \
--header 'Content-Type: application/json'
```

- Para listar os top 100 de Urls, digite o comando:
```sh
curl --location --request GET 'http://localhost:3000/api/v1/short_urls?top=100' \
--header 'Content-Type: application/json'
```
### Cadastro de user na api via CURL:

```sh
curl --location --request POST 'http://localhost:3000/signup' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Joathan Francisco",
    "email": "joathanf@gmail.com",
    "password": "123456"
}'
```

## Melhorias na implementação:

- Paginação dos resultados
- Mais coberturas de testes