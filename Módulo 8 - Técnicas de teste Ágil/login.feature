# language: pt
Funcionalidade: Login na plataforma
Como cliente da EBAC-SHOP
Quero fazer o login (autenticação) na plataforma  
Para visualizar meus pedidos

  Contexto: 
    Dado que estou na página de Login

  Esquema do Cenário: Login com Dados Válidos
    Quando eu inserir um nome de <usuario> e <senha> válidos
    E eu clicar no botão <botao>
    Então devo ser redirecionado para a tela "MINHA CONTA"

  Esquema do Cenário: Login com usuário inválido
    Quando eu inserir um nome de <usuario> inválido
    E eu inserir uma <senha> válida
    Quando eu clicar no botão <botao>
    Então devo ver uma mensagem de alerta informando <mensagem>

  Esquema do Cenário: Login com senha inválida
    Quando eu inserie um nome de <usuario> válido
    E eu inserir uma <senha> inválida
    Quando eu clicar no botão <botao>
    Então devo ver uma mensagem de alerta informando <mensagem>

    Exemplos: 
      | usuario               | senha       | botao | mensagem                                                                                                                                      |
      | Rodrigo               |      123456 | Login |                                                                                                                                               |
      | automacao.com         |      123456 | Login | Erro: o usuário utomacao.com não está cadastrado neste site. Se você não está certo de seu nome de usuário, experimente o endereço de e-mail. |
      | rodrigo@automacao.com | asd11477447 | Login | Erro: a senha fornecida para o e-mail rodrigo@automacao.com está incorreta. Perdeu a senha?                                                   |
