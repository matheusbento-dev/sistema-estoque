// lib/services/movimentacao_service.dart
//
// Orquestra a criação de movimentações a partir de outras operações
// (entrada, venda, ajuste, transferência) e garante que toda alteração de
// estoque passe por aqui antes de chegar em estoque_service (RNF-01).
//
// O que este arquivo irá conter:
//   - método genérico para registrar uma nova Movimentacao (validando
//     produto, quantidade e responsável) e, em seguida, chamar
//     estoque_service.aplicarNoEstoque para refletir o efeito dela;
//   - lógica específica de transferência entre localizações: gera a(s)
//     movimentação(ões) necessária(s) sem alterar o total do produto
//     (RF-MOV-02);
//   - consultas de histórico por produto/período, delegando ao
//     movimentacao_repository, para apoiar telas de consulta da CLI.
//
// DECISÃO EM ABERTO: se a transferência gera uma linha (origem+destino) ou
// duas linhas (saída+entrada) em movimentacoes — ver
// docs/decisoes_em_aberto.md; a escolha muda a implementação deste método.
