// lib/services/estoque_service.dart
//
// Camada central de regras de negócio sobre quantidade em estoque —
// provavelmente o service mais importante do sistema.
//
// O que este arquivo irá conter:
//   - método `aplicarNoEstoque(Movimentacao)`: usa um switch sobre
//     TipoMovimentacao para decidir se a quantidade deve ser somada,
//     subtraída, ou ter reserva ajustada, e então chama
//     estoque_repository para persistir — é aqui, e só aqui, que a
//     quantidade em Estoque muda, sempre em resposta a uma Movimentacao já
//     registrada (nunca uma edição direta, conforme RNF-01);
//   - cálculo de quantidade disponível (físico − reservado, RF-EST-02);
//   - verificação de estoque mínimo, para apoiar RF-EST-03 e o alerta
//     RF-NOT-01;
//   - verificação de produtos sem movimentação durante um período
//     configurável (RF-EST-04).
