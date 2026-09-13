// lib/models/entrada.dart
//
// Representa o recebimento de mercadorias de um fornecedor (RF-ENT-01).
//
// Campos que este model irá conter:
//   - referência ao fornecedor;
//   - número da nota fiscal;
//   - data da operação;
//   - referência ao funcionário responsável pelo recebimento.
//
// Uma Entrada pode conter vários produtos ao mesmo tempo (uma nota fiscal
// com múltiplos itens) — cada item é representado separadamente em
// lib/models/entrada_item.dart, para não misturar dados da nota (1) com
// dados de cada produto recebido (N).
//
// Ao ser confirmada, uma Entrada deve gerar uma Movimentacao do tipo
// `entrada` para cada item (responsabilidade de
// lib/services/entrada_service.dart, não deste model).
