// lib/cli/menu_notificacoes.dart
//
// Tela de terminal que consolida os alertas visuais do sistema
// (RF-NOT-01/02/03), exibida automaticamente ao Administrador logar e
// também acessível como opção de menu a qualquer momento.
//
// O que este arquivo irá conter:
//   - chamada a notificacao_service.buscarAlertasPara(usuarioLogado);
//   - exibição categorizada dos alertas: estoque abaixo do mínimo,
//     divergências de inventário pendentes, ajustes aguardando
//     autorização;
//   - atalhos para ir direto ao menu correspondente a partir de um alerta
//     (ex.: ver um ajuste pendente direto em menu_ajustes.dart).
