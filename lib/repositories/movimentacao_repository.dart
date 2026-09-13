// lib/repositories/movimentacao_repository.dart
//
// Camada de acesso a dados para Movimentacao — a tabela de histórico mais
// importante do sistema (RNF-01).
//
// Operações que este arquivo irá conter:
//   - inserir uma nova movimentação (nunca update/delete: histórico é
//     append-only, conforme princípio de preservação do histórico);
//   - listar movimentações por produto, por período e por tipo, para
//     apoiar consultas e o relatório de movimentações (RF-REL-01/02).
