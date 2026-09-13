// lib/services/auth_service.dart
//
// Responsável por autenticação e checagem de permissão — usado por todos
// os demais services antes de executar uma operação sensível (RNF-03).
//
// O que este arquivo irá conter:
//   - método de login: recebe login+senha, busca o usuário via
//     usuario_repository, compara o hash da senha e retorna o Usuario
//     autenticado (ou erro/nulo se inválido);
//   - método de verificação de permissão (ex.: `exigirAdministrador`),
//     usado por ajuste_service, usuario_service e fornecedor_service antes
//     de operações restritas (RF-USR-03, RF-AJU-02);
//   - suporte ao fluxo de "login-switching" decidido pela equipe: como não
//     há notificação push (sem servidor), a troca de sessão entre
//     Funcionário e Administrador é o mecanismo usado para o administrador
//     revisar pendências (ver menu_login.dart e notificacao_service.dart).
