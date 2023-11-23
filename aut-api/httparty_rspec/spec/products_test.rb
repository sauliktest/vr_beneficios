require 'httparty'
require 'json'

RSpec.describe 'Validar a API VRPAT' do
  before(:all) do
    @base_uri = 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'
    response = HTTParty.get(@base_uri)
    @parsed_response = JSON.parse(response.body)
  end

  it 'Deve retornar 200 para a requisição válida' do
    response = HTTParty.get(@base_uri)
    expect(response.code).to eql(200)
  end

  it 'O retorno não deve ser vazio' do
    response = HTTParty.get(@base_uri)
    expect(response.parsed_response).not_to be_empty
  end

  it 'Os tipos de dados dos campos devem ser corretos' do
    item = @parsed_response['products'][0] # ou qualquer índice desejado
    expect(item['adquirirCartao']).to be(true).or be(false)
    expect(item['percentualCartao']).to be_an(Integer)
    expect(item['id']).to be_an(Integer)
    expect(item['nome']).to be_a(String)
    expect(item['exibirRede']).to be(true).or be(false)
    expect(item['produtoAlimentacao']).to be(true).or be(false)
    expect(item['produtoRefeicao']).to be(true).or be(false)
  end

  it 'Deve incluir a chave "typeOfEstablishment" no JSON de resposta' do
    expect(@parsed_response).to have_key('typeOfEstablishment')
  end

  it 'Deve imprimir aleatoriamente um tipo de estabelecimento' do
    type_of_establishment = @parsed_response['typeOfEstablishment']

    unless type_of_establishment.nil? || type_of_establishment.empty?
      random_type = type_of_establishment.sample
      puts "Randomizando o Type of Establishment: #{random_type}"
    else
      puts 'Nenhum Type of Establishment na resposta.'
    end
  end
end
