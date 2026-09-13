// lib/cli/menu_entradas.dart
//
// Tela de terminal para registrar entrada de mercadorias (RF-ENT-01).
//
// O que este arquivo irá conter:
//   - seleção do fornecedor (obrigatório — RF-FOR-03) e informação da nota
//     fiscal;
//   - adição de múltiplos itens (produto, quantidade, preço de compra) à
//     mesma entrada antes de confirmar;
//   - confirmação final, que chama entrada_service para persistir e gerar
//     as movimentações correspondentes.
