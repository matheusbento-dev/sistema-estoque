// lib/repositories/ajuste_repository.dart
//
// Camada de acesso a dados para Ajuste (RF-AJU-01/02).
//
// Operações que este arquivo irá conter:
//   - inserir um ajuste com status `pendente`;
//   - atualizar o status de um ajuste para `autorizado` ou `rejeitado`
//     (somente chamado por lib/services/ajuste_service.dart após validar
//     que quem está autorizando tem perfil administrador — RNF-03);
//   - listar ajustes pendentes de autorização (apoio a RF-NOT-03).
