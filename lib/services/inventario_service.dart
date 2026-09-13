// lib/services/inventario_service.dart
//
// Regras de negócio do módulo de inventário (RF-INV-01/02).
//
// O que este arquivo irá conter:
//   - abertura de um novo inventário periódico;
//   - para cada produto conferido: comparar quantidade registrada (via
//     estoque_service) com a quantidade informada pelo funcionário;
//   - quando os valores forem iguais, marcar o item como consistente
//     automaticamente;
//   - quando houver diferença, calcular a diferença, gerar uma ocorrência
//     com status `pendente` (nunca ajustar o estoque automaticamente) e
//     disparar uma notificação para o Administrador (RF-NOT-02) via
//     notificacao_service.
