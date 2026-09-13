// lib/models/enums/perfil_usuario.dart
//
// Enum com os dois perfis de acesso definidos pela equipe para o
// protótipo (RF-USR-02): funcionario e administrador.
//
// O que este enum irá conter:
//   - Os dois valores do perfil.
//   - Possivelmente um helper para verificar se um perfil tem permissão
//     administrativa (usado por RF-USR-03 e RF-AJU-02, que restringem
//     autorização de ajustes e gerenciamento de usuários/fornecedores ao
//     Administrador).
//
// Usado por lib/models/usuario.dart e por todos os services que precisam
// validar permissão antes de executar uma operação sensível (RNF-03).
