require 'HTTParty'
require 'httparty/request'
require 'httparty/response/headers'

class Prod
  include HTTParty
  base_uri 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'


  def enviar_requisicao
    self.class.get('/')
  end

  def listar_todos_produtos
    response = enviar_requisicao

    if response.success?
      puts "Status Code: #{response.code}"
      puts response.parsed_response
    else
      raise "Erro na requisição: #{response.code}"
    end
  end

  def listar_produto_aleatorio
    response = enviar_requisicao

    if response.success?
      tipo_estabelecimento = response['typeOfEstablishment']

      unless tipo_estabelecimento.nil? || tipo_estabelecimento.empty?
        tipo_aleatorio = tipo_estabelecimento.sample
        puts "Tipo de Estabelecimento Aleatório: #{tipo_aleatorio}"
      else
        puts 'Nenhum Tipo de Estabelecimento na resposta.'
      end
    else
      raise "Erro na requisição: #{response.code}"
    end
  end
end

