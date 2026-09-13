// lib/cli/menu_login.dart
//
// Tela inicial de autenticação, exibida antes de qualquer outro menu.
//
// O que este arquivo irá conter:
//   - solicitação de login e senha;
//   - chamada a auth_service para validar as credenciais;
//   - em caso de sucesso, define o usuário logado em cli_app.dart e segue
//     para menu_principal.dart;
//   - em caso de falha, exibe erro e permite nova tentativa;
//   - ponto de entrada do fluxo de "login-switching": quando um
//     Administrador precisa revisar pendências (ajustes/divergências), ele
//     sai do usuário Funcionário e loga aqui novamente com sua própria
//     conta.
