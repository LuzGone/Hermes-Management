# Hermes - Sistema de Gestão de Entregas

OBS: Esse projeto necessita de um outro para acessar a parte do cliente que está presente no seguinte repositório:

[Hermes-Client](https://github.com/luzgone/hermes-client)

* Ruby version 3.3.4

* Dependencies
  * PostgreSQL
  * Redis
  * [Hermes-Client](https://github.com/luzgone/hermes-client)

## Passo a Passo

* Altere o arquivo **./config/database.yml** para o username e o password do seu usuário no postgresql;

* Instalar as gems necessárias

```bash
$ bundle install
```

* Iniciar o Redis

```bash
$ docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
$ docker exec -it redis-stack redis-cli
```

* Para iniciar a aplicação pela primeira vez você pode rodar o seguinte comando

```bash
$ rails db:create db:migrate db:seed
```

* Ele cria o banco, as tabelas e povoa o banco de dados com os dados que você pode alterar em **./db/seeds.rb**

* Se em algum momento você quer repovoar o banco de dados do zero basta usar o seguinte comando

```bash
$ rails db:drop db:create db:migrate db:seed
```

* Iniciar o sidekiq

```bash
$ bundle exec sidekiq
```

* Iniciar essa aplicação

```bash
$ rails s -p 3000
```

* Se deu tudo certo no tela inicial da aplicação deverá aparecer um menu de login para motorista e usuário, se você olhar o arquivo de seed lá os emails de usuários sempre são **<usuarioX@email.com>** sendo X um numero do usuário começando a partir de 1, e a senha é **usuarioX**, O mesmo se aplica para motorista sendo **<motoristaX@email.com>** e sua senha **motoristaX**.

* Segue abaixo uma tela da aplicação funcionando

![Imagem da aplicação hermes funcionando](/hermes.png)