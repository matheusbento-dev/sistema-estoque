// lib/models/entrada_item.dart
//
// Representa um item (linha de produto) dentro de uma Entrada (RF-ENT-01).
//
// Campos que este model irá conter:
//   - referência à entrada (nota fiscal);
//   - referência ao produto;
//   - quantidade recebida;
//   - preço de compra daquele item nessa entrada específica (pode diferir
//     do preço padrão cadastrado em ProdutoFornecedor, por isso fica aqui
//     também, e não só no vínculo produto-fornecedor).
