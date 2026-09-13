// lib/cli/menu_usuarios.dart
//
// Telas de terminal para o módulo de usuários e permissões (RF-USR-01/02/
// 03), restrito ao perfil Administrador.
//
// O que este arquivo irá conter:
//   - cadastro de novo usuário (nome, login, senha, perfil);
//   - listagem de usuários cadastrados;
//   - bloqueio de acesso a este menu para usuários com perfil Funcionário
//     (checado via auth_service antes mesmo de exibir a opção no
//     menu_principal.dart).
