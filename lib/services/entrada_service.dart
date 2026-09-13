// lib/services/entrada_service.dart
//
// Regras de negócio do módulo de entradas de mercadoria (RF-ENT-01).
//
// O que este arquivo irá conter:
//   - validação de que a entrada possui fornecedor cadastrado antes de
//     permitir o registro (RF-FOR-03: nenhuma entrada sem fornecedor
//     existente);
//   - validação de que a entrada possui ao menos um item, com produto,
//     quantidade e preço de compra;
//   - após salvar a entrada, chamar movimentacao_service para gerar uma
//     Movimentacao do tipo `entrada` para cada item (RF-MOV-01).
