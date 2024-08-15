# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Primeiros Passos
- Ter o Postgres Instalado com o usuário: hermes e senha: hermes
 
=> Depois disso só rodar os seguintes comandos em sequencia

- bundler install
- rails db:drop db:create db:migrate db:seed
- rails s