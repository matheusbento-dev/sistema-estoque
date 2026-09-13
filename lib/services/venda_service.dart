// lib/services/venda_service.dart
//
// Regras de negócio do módulo de vendas simplificadas (RF-VEN-01/02/03).
//
// O que este arquivo irá conter:
//   - validação de que a venda possui ao menos um item;
//   - validação de que a quantidade vendida de cada item não ultrapassa a
//     quantidade DISPONÍVEL do produto (não a física — consulta via
//     estoque_service, respeitando RF-EST-02);
//   - ao confirmar a venda, gerar automaticamente uma Movimentacao do tipo
//     `venda` para cada item, via movimentacao_service (RF-VEN-02).
//
// Lembrete de escopo: este service deve permanecer simples de propósito —
// sem cálculo de descontos, impostos, múltiplas formas de pagamento ou
// qualquer lógica de um sistema comercial completo.
