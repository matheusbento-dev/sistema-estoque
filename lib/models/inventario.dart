// lib/models/inventario.dart
//
// Representa um evento de inventário físico periódico (RF-INV-01),
// proposto para ocorrer mensalmente.
//
// Campos que este model irá conter:
//   - data de abertura do inventário;
//   - referência ao usuário que abriu o inventário;
//   - status geral do inventário (em andamento / concluído).
//
// A comparação produto a produto (quantidade registrada vs. quantidade
// contada) não fica aqui — fica em lib/models/inventario_item.dart, um
// item por produto conferido dentro deste inventário.
