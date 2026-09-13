// lib/models/movimentacao.dart
//
// Representa um registro histórico de movimentação de estoque (RF-MOV-01,
// RNF-01). É o núcleo de rastreabilidade do sistema: toda alteração de
// quantidade deve gerar uma linha aqui — nunca uma edição direta de
// quantidade em Estoque.
//
// Campos que este model irá conter:
//   - referência ao produto;
//   - quantidade movimentada;
//   - data/hora da operação;
//   - referência ao usuário responsável;
//   - tipo da operação (TipoMovimentacao — ver
//     lib/models/enums/tipo_movimentacao.dart);
//   - referência à localização de origem e, quando aplicável (transferência),
//     à localização de destino;
//   - referência opcional à operação de origem (entrada, venda, ajuste,
//     etc.), para permitir rastrear de onde veio aquela movimentação.
//
// Este model é um objeto de dados puro. Quem decide QUANTO somar/subtrair
// em Estoque a partir de uma Movimentacao é
// lib/services/estoque_service.dart (método `aplicarNoEstoque`, usando um
// switch sobre TipoMovimentacao), não este arquivo.
//
// DECISÃO EM ABERTO: se uma transferência é uma única linha (com origem e
// destino) ou duas linhas linkadas (saída + entrada) — ver
// docs/decisoes_em_aberto.md.
