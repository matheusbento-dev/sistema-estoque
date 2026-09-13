// lib/models/venda.dart
//
// Representa uma venda simplificada (RF-VEN-01), cujo único papel no
// projeto é demonstrar a geração de uma saída de estoque — não é um
// sistema comercial completo (sem financeiro, sem emissão fiscal, sem
// múltiplas formas de pagamento reais).
//
// Campos que este model irá conter:
//   - data da venda;
//   - referência ao vendedor (usuário logado no momento da venda);
//   - referência ao cliente (opcional/simplificado, RF-VEN-03);
//   - forma de pagamento (campo simples, texto ou enum básico).
//
// Os produtos vendidos e suas quantidades não ficam aqui — ficam em
// lib/models/venda_item.dart, um item por produto vendido.
//
// Ao confirmar a venda, RF-VEN-02 exige gerar automaticamente uma
// Movimentacao do tipo `venda` para cada item — responsabilidade de
// lib/services/venda_service.dart.
