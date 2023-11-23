#language: pt
@crud
Funcionalidade: Consultar produtos através da API
Como um aplicação de serviço
Quero enviar requisições para obter produtos
e verificar se as informações são apresentadas corretamente


Contexto:
Dado a API Listar Produtos definida

@todos_produtos
Cenario: Listar todos os produtos
Quando a requisicao for enviada
Então posso visualizar as informações de todos os produtos

@produto_aleatorio
Cenario: Listar produto aleatoriamente
Quando a requisição para obter detalhes de um produto aleatório é enviada
Então posso visualizar as informações deste produto

