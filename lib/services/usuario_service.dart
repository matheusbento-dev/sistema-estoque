// lib/services/usuario_service.dart
//
// Regras de negócio do módulo de usuários e permissões (RF-USR-01/02/03).
//
// O que este arquivo irá conter:
//   - validação de login único antes de cadastrar um novo usuário;
//   - hashing da senha antes de persistir (nunca texto puro);
//   - checagem de permissão: cadastro/edição de usuários é restrito ao
//     perfil Administrador (auth_service.exigirAdministrador);
//   - atribuição do perfil de acesso (PerfilUsuario) no cadastro.
