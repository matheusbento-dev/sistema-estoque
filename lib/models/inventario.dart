/// Situação do inventário.
///   aberto  -> contagens podem ser registradas (e refeitas se digitou errado)
///   fechado -> contagens congeladas; divergências podem ser ajustadas
enum StatusInventario {
  aberto('Aberto'),
  fechado('Fechado');

  const StatusInventario(this.rotulo);
  final String rotulo;

  String get valorBanco => name.toUpperCase();
  static StatusInventario doBanco(String valor) =>
      StatusInventario.values.byName(valor.toLowerCase());
}

/// Cabeçalho de um inventário (RF-INV-01).
class Inventario {
  final int id;
  final StatusInventario status;
  final String abertoPorNome;
  final DateTime dataAbertura;
  final DateTime? dataFechamento;
  final String? observacao;

  const Inventario({
    required this.id,
    required this.status,
    required this.abertoPorNome,
    required this.dataAbertura,
    this.dataFechamento,
    this.observacao,
  });

  bool get estaAberto => status == StatusInventario.aberto;
}

/// Uma contagem física de um produto em um local (RF-INV-01 / RF-INV-02).
///
/// [quantidadeSistema] é a "fotografia" do saldo no momento da contagem.
/// [diferenca] = contada - sistema (calculada pelo próprio MySQL).
/// [ajustado] diz se já existe um AJUSTE ligado a este item.
class ItemInventario {
  final int id;
  final int inventarioId;
  final StatusInventario statusInventario;
  final int produtoId;
  final String produtoCodigo;
  final String produtoNome;
  final int localizacaoId;
  final String localizacaoNome;
  final int quantidadeSistema;
  final int quantidadeContada;
  final int diferenca;
  final String contadoPorNome;
  final DateTime dataContagem;
  final bool ajustado;

  const ItemInventario({
    required this.id,
    required this.inventarioId,
    required this.statusInventario,
    required this.produtoId,
    required this.produtoCodigo,
    required this.produtoNome,
    required this.localizacaoId,
    required this.localizacaoNome,
    required this.quantidadeSistema,
    required this.quantidadeContada,
    required this.diferenca,
    required this.contadoPorNome,
    required this.dataContagem,
    required this.ajustado,
  });

  bool get consistente => diferenca == 0;

  /// Divergência que ainda não recebeu ajuste.
  bool get divergenciaPendente => diferenca != 0 && !ajustado;
}
