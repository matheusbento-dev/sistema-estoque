// lib/models/usuario.dart
//
// Representa um usuário (funcionário) do sistema (RF-USR-01).
//
// Campos que este model irá conter:
//   - identificador único;
//   - nome;
//   - login (único por usuário);
//   - senha (armazenada como hash — nunca em texto puro, conforme
//     RF-USR-01);
//   - perfil de acesso (PerfilUsuario: funcionario ou administrador —
//     RF-USR-02).
//
// A validação de permissão (o que cada perfil pode ou não fazer) não fica
// neste model — fica centralizada em lib/services/auth_service.dart e é
// checada por cada service antes de executar uma operação sensível
// (RNF-03).
