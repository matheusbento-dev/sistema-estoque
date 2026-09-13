// lib/repositories/usuario_repository.dart
//
// Camada de acesso a dados para Usuario (RF-USR-01).
//
// Operações que este arquivo irá conter:
//   - buscar usuário por login (para autenticação, usado por
//     lib/services/auth_service.dart);
//   - cadastrar/listar/atualizar usuários (restrito a Administrador —
//     RF-USR-03);
//   - garantir unicidade de login na busca antes de cadastrar.
//
// Este arquivo NUNCA compara senha em texto puro — apenas retorna o hash
// armazenado para que auth_service.dart faça a comparação com o hash da
// senha informada.
