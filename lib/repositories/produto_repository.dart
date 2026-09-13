// lib/repositories/produto_repository.dart
//
// Camada de acesso a dados para Produto. Responsável apenas por traduzir
// operações em SQL (SELECT/INSERT/UPDATE) sobre a tabela de produtos —
// nenhuma regra de negócio ou validação deve estar aqui (isso é papel de
// lib/services/produto_service.dart).
//
// Operações que este arquivo irá conter:
//   - buscar produto por código (busca exata) e por nome (busca parcial),
//     conforme RF-PROD-02;
//   - inserir e atualizar um produto;
//   - marcar um produto como inativo (UPDATE de flag, nunca DELETE físico
//     quando há histórico — RF-PROD-03/RNF-02);
//   - listar produtos (com filtro de ativos/inativos).
//
// Usa lib/database/database_connection.dart para executar as queries.
