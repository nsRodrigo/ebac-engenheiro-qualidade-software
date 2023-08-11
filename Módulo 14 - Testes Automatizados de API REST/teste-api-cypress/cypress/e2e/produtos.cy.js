/// <reference types="cypress"/>

describe("Produtos - Testes de API ServeRest", () => {

    let token;

    before(() => {
        cy.token("fulano@qa.com", "teste").then((tkn) => {
            token = tkn
        });
    });

    it("Deve listar produtos com sucesso", () => {
        cy.api({
            method: "GET",
            url: "produtos",
        }).then((response) => {
            expect(response.body.produtos[0].nome).to.include("Ebac");
            expect(response.status).to.equal(200);
            expect(response.body).to.have.property("produtos");
            //expect(response.duration).to.be.lessThan(15);
        });
    });

    it("Deve validar mensagem de cadastro de produto", () => {

        let produto = `Produdo Ebac ${Math.floor(Math.random() * 10000000)}`;
        let valor = Math.floor(Math.random() * 1000);
        let qtd = Math.floor(Math.random() * 100);

        cy.cadastrarProduto(produto, valor, "Novo Produto", qtd, token).then((response) => {
            expect(response.status).to.equal(201);
            expect(response.body.message).to.equal("Cadastro realizado com sucesso");
        });
    });

    it("Deve validar mensagem de erro para cadastro de produto repetido", () => {
        cy.cadastrarProduto("Logitech MX Keys", 250, "Novo Produto", 10, token).then((response) => {
            expect(response.status).to.equal(400);
            expect(response.body.message).to.equal("Já existe produto com esse nome");
        });
    });
});
