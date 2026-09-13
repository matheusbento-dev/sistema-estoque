// lib/models/fornecedor.dart
//
// Representa um fornecedor cadastrado (RF-FOR-01).
//
// Campos que este model irá conter:
//   - identificador único;
//   - nome/razão social do fornecedor;
//   - dados de contato básicos (a definir o nível de detalhe necessário).
//
// A relação entre um fornecedor e um produto (com código usado pelo
// fornecedor e preço de compra específico daquele vínculo) NÃO fica aqui —
// fica em lib/models/produto_fornecedor.dart, já que um produto pode ter
// vários fornecedores e não existe fornecedor "principal" (RF-FOR-02).
