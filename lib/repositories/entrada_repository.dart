// lib/repositories/entrada_repository.dart
//
// Camada de acesso a dados para Entrada e EntradaItem (RF-ENT-01).
//
// Operações que este arquivo irá conter:
//   - inserir uma entrada (nota fiscal) com seus múltiplos itens em uma
//     única operação atômica (transação), já que uma entrada sem fornecedor
//     não pode existir (RF-FOR-03);
//   - buscar entradas por fornecedor, data ou número de nota fiscal.
