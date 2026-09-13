// lib/models/venda_item.dart
//
// Representa um item (produto + quantidade) dentro de uma Venda
// (RF-VEN-01).
//
// Campos que este model irá conter:
//   - referência à venda;
//   - referência ao produto;
//   - quantidade vendida;
//   - valor unitário no momento da venda.
//
// Regra de negócio associada (validada em lib/services/venda_service.dart,
// não aqui): a quantidade vendida não pode ultrapassar a quantidade
// DISPONÍVEL do produto (não a física — ver RF-EST-02).
