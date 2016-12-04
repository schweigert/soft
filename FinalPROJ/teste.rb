require "test/unit"

require_relative "usuario"
require_relative "ponto"
require_relative "rota"
require_relative "mapa"

Usuario.setupUsuario 0
Ponto.setupPontos
Rota.setupRotas
Mapa.setupMapa

class TesteUsuario < Test::Unit::TestCase

  def test_usuario
    for i in 1..10
      Usuario.setupUsuario i
      assert(i == Usuario.posicao())
    end
  end

  def test_djkst
    Usuario.setupUsuario 19
    objetivo = Usuario.dijkstra 45

    resp = { 19=>["0249S1", "0249S2", "0151S1", "0151S2", "0152S1", "0152S2"], 18=>["0249S1", "0249S2", "0151S1", "0152S1", "0101S2"], 17=>["0249S1","0249S2", "0239S1", "0239S2", "0263S1", "0263S2", "0101S1", "0101S2"], 16=>["0249S1", "0249S2", "0239S1", "0239S2", "0263S1", "0263S2", "0101S1", "0101S2"], 40=>["0151S1", "0151S2", "0152S1", "0152S2", "0101S1"], 45=>["0152S1"] }
    assert(resp == objetivo)
  end

end

class TestePonto < Test::Unit::TestCase

  def test_pontos
    Ponto.setupPontos
    pontos = Hash.new

    pontos[24] = "Rua Almirante Jaceguay"
    pontos[35] = "Rua dos Suíços"
    pontos[45] = "Estação Vila Nova"
    pontos[79] = "Rua Bernardo Welter"

    for i in pontos.keys
      assert(pontos[i].delete(" ") == Ponto.pontos[i].delete(" "))
    end

  end

end


class TesteRotas < Test::Unit::TestCase

  def test_intersec
    assert(
      [120, 121, 122, 123,124] == Rota.intersecsao("0305S1", "0306S1")
    )
  end

end
