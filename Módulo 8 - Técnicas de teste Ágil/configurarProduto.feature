# language: pt
Funcionalidade: Configurar produto
Como cliente da EBAC-SHOP
Quero configurar meu produto de acordo com meu tamanho e gosto
E escolher a quantidade
Para depois inserir no carrinho

  Contexto: 
    Dado que estou na página do produto

  Esquema do Cenario: Validar mensagem ao tentar comprar um produto sem selecionar opções obrigatórias
    E eu não selecionar uma <cor>, <tamanho> ou <quantidade>
    Quando eu clicar no botão de <botao>
    Então o sistema deve exibir uma mensagem de alerta informando <mensagem>

  Esquema do Cenario: Limpar Configuração de Produto no processo de compra
    Quando selecionei uma <cor>, um <tamanho>
    E eu clicar no botão <botao>
    Então todos os campos de seleção de cor, tamanho e quantidade devem ser redefinidos aos valores iniciais
    E o botão <botao> deve ficar desabilitado

  Esquema do Cenario: Limite de Produtos por Venda
    Quando eu adicionar <quantidade> produtos diferentes ao carrinho
    E eu clicar no botão <botao>
    Então devo ver uma mensagem de erro informando que <mensagem>

    Exemplos: 
      | cor   | tamanho | quantidade | botao            | mensagem                                                              |
      |       |         |            | Comprar          | Selecione uma das opções do produto antes de adicioná-lo ao carrinho. |
      | Blue  | S       |          1 | Limpar           |                                                                       |
      | preto | M       |         11 | finalizar compra | o limite máximo de 10 produtos por venda foi atingido                 |
