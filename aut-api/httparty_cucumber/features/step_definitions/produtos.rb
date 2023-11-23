#Consultar Produtos
Dado("a API Listar Produtos definida") do
  @prod = Prod.new
end

Quando("a requisicao for enviada") do
  @prod.enviar_requisicao
end

Então("posso visualizar as informações de todos os produtos") do
  @prod.listar_todos_produtos
end

Quando("a requisição para obter detalhes de um produto aleatório é enviada") do
  @prod.enviar_requisicao
end

Então("posso visualizar as informações deste produto") do
  @prod.listar_produto_aleatorio
end
