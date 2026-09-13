// lib/cli/menu_ajustes.dart
//
// Telas de terminal para o módulo de ajustes (RF-AJU-01/02), com a etapa
// de autorização restrita ao perfil Administrador (verificada por
// ajuste_service/auth_service, não apenas escondida no menu).
//
// O que este arquivo irá conter:
//   - listagem de ajustes pendentes de autorização;
//   - tela de análise de um ajuste pendente, com opção de autorizar
//     (solicitando confirmação) ou rejeitar;
//   - registro de um ajuste manual, com campo de motivo obrigatório.
