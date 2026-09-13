// lib/services/fornecedor_service.dart
//
// Regras de negócio do módulo de fornecedores (RF-FOR-01/02/03).
//
// O que este arquivo irá conter:
//   - validação de dados obrigatórios ao cadastrar um fornecedor;
//   - regra de vínculo produto-fornecedor: permite múltiplos fornecedores
//     por produto, sem exigir um fornecedor "principal" (RF-FOR-02);
//   - checagem de permissão: gerenciamento de fornecedores é restrito ao
//     perfil Administrador (usa auth_service.exigirAdministrador).
