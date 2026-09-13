// lib/services/produto_service.dart
//
// Regras de negócio do módulo de produtos (RF-PROD-01/02/03).
//
// O que este arquivo irá conter:
//   - validação de campos obrigatórios (código e nome) antes de cadastrar;
//   - lógica de busca combinando código (exato) e nome (parcial),
//     delegando a query em si ao produto_repository;
//   - regra de inativação: impedir exclusão física e, em vez disso, marcar
//     o produto como inativo quando houver movimentações associadas
//     (RF-PROD-03/RNF-02) — verificação feita consultando
//     movimentacao_repository antes de decidir o tipo de exclusão.
