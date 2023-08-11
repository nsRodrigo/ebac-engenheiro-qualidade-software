# language: pt
Funcionalidade: Tela de cadastro - Checkout
Como cliente da EBAC-SHOP
Quero fazer concluir meu cadastro   
Para finalizar minha compra

  Contexto: 
    Dado que estou na Tela de Cadastro - Checkout

  Esquema do Cenario: Cadastro com campo obrigatórios vazios
    Quando eu deixar o campo obrigatório <nome> vazio
    E eu clicar no botão "Finalizar Compra"
    Então o sistema deve exibir uma mensagem de alerta informando <mensagem>

  Esquema do Cenario: Cadastro com e-mail inválido
    Quando eu preencher os campos <nome>, <sobrenome>, <país>, <endereco>, <cidade>, <estado>, <CEP>, <telefone>
    E eu preencher o campo <email> com um formato inválido
    E eu clicar no botão "Finalizar Compra"
    Então o sistema deve exibir uma mensagem de alerta informando <mensagem>

  Esquema do Cenario: Cadastro com todos os dados obrigatórios
    Quando eu preencher os campos obrigatórios <nome>, <sobrenome>, <país>, <endereco>, <cidade>, <estado>, <CEP>, <telefone> e <email>
    E eu clicar no botão "Finalizar Compra"
    Então o sistema deve cadastrar o usuário com sucesso
    E eu visualizo que sou direcionado para tela com titulo "PEDIDO RECEBIDO"

    Exemplos: 
      | nome | sobrenome | país   | endereco | cidade    | estado    | CEP      | telefone  | email                  | mensagem                                                          |
      |      | Smith     | Brasil | Rua A    | São Paulo | São Paulo | 01234567 | 119876543 | john.smith@example.com | O campo "Nome" do endereço de faturamento é um campo obrigatório. |
      | John | Smith     | Brasil | Rua A    | São Paulo | São Paulo | 01234567 | 119876543 | example.com            | E-mail de faturamento inválido                                    |
      | John | Smith     | Brasil | Rua A    | São Paulo | São Paulo | 01234567 | 119876543 | john.smith@example.com |                                                                   |
