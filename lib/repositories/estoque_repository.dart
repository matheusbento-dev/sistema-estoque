// lib/repositories/estoque_repository.dart
//
// Camada de acesso a dados para Estoque (quantidade de um produto por
// localização).
//
// Operações que este arquivo irá conter:
//   - buscar a quantidade (física/reservada/disponível) de um produto em
//     uma localização específica;
//   - somar a quantidade total de um produto em todas as localizações
//     (RF-EST-01);
//   - atualizar quantidade física e reservada — sempre chamado a partir de
//     lib/services/estoque_service.dart em resposta a uma Movimentacao,
//     nunca diretamente pela camada CLI (RNF-01: nenhuma UPDATE direta de
//     quantidade sem passar por uma operação registrada);
//   - listar produtos com quantidade disponível abaixo do estoque mínimo
//     (apoio a RF-EST-03/RF-NOT-01).
