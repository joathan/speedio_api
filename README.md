# README

Setup:

Usando o docker, execute no terminal:

```sh
docker-compose up -d
```

Endereço do fontend:
http://localhost:8080

Endereço da api: 
http://localhost:3000

Cadastro na api via CURL:

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
- Testes nos frontend
- 