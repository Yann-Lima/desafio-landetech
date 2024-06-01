# README

Este é o README do projeto Desafio Landetech.

## Como baixar o projeto do Git

Para baixar este projeto do Git, siga os passos abaixo:

1. Abra o terminal ou prompt de comando.
2. Navegue até o diretório onde você deseja clonar o projeto.
3. Execute o seguinte comando:

git clone https://github.com/Yann-Lima/desafio-landetech.git

## Como testar o projeto

Para testar este projeto, você precisará ter o seguinte instalado em sua máquina:

- Ruby versão 2.7.2
- Rails versão 6.0.0
- Postman (para testes de requisições HTTP)

Após baixar o projeto do Git, siga as etapas abaixo para testá-lo:

1. Navegue até o diretório do projeto no terminal ou prompt de comando.
2. Execute o seguinte comando para instalar as dependências do projeto:

bundle install


3. Execute o seguinte comando para criar o banco de dados e executar as migrações:

rails db:migrate

4. Execute o seguinte comando para iniciar o servidor local:

rails server


Agora o servidor estará em execução e você poderá fazer requisições para testar o projeto.

## Testes do CRUD

Aqui estão os testes para cada operação do CRUD:

### Create (Criar)

1. Abra o Postman.
2. Faça uma requisição POST para `http://localhost:3000/recruiters`.
3. No corpo da requisição, inclua os dados do novo recrutador no formato JSON.
4. Envie a requisição.

### Read (Ler)

1. Abra o Postman.
2. Faça uma requisição GET para `http://localhost:3000/recruiters`.
3. Envie a requisição.

### Update (Atualizar)

1. Abra o Postman.
2. Faça uma requisição PUT para `http://localhost:3000/recruiters/:id`, onde `:id` é o ID do recrutador que você deseja atualizar.
3. No corpo da requisição, inclua os dados atualizados do recrutador no formato JSON.
4. Envie a requisição.

### Delete (Deletar)

1. Abra o Postman.
2. Faça uma requisição DELETE para `http://localhost:3000/recruiters/:id`, onde `:id` é o ID do recrutador que você deseja deletar.
3. Envie a requisição.

## Teste unitário

Os testes unitários podem ser escritos usando a estrutura de testes integrada do Rails. Você pode criar testes para as diferentes partes do seu código, como modelos, controladores e helpers.

## Teste de request

Os testes de requisição podem ser feitos usando ferramentas como RSpec e Capybara para simular interações do usuário com a aplicação através de requisições HTTP.

