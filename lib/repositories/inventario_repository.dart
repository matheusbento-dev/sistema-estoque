// lib/repositories/inventario_repository.dart
//
// Camada de acesso a dados para Inventario e InventarioItem (RF-INV-01/02).
//
// Operações que este arquivo irá conter:
//   - abrir um novo inventário;
//   - inserir a conferência de cada produto (quantidade registrada vs.
//     encontrada), incluindo o cálculo de diferença já resolvido pelo
//     service antes de persistir;
//   - listar itens de inventário com status `pendente`, para apoiar a
//     notificação ao administrador (RF-NOT-02).
