// lib/models/enums/tipo_movimentacao.dart
//
// Enum que representa os tipos possíveis de movimentação de estoque,
// conforme RF-MOV-01. Decisão já tomada pela equipe: usar um enum em vez
// de uma hierarquia de classes, para manter uma única tabela
// `movimentacoes` confiável para consultas históricas (ver decisão de
// arquitetura registrada para o projeto).
//
// Valores que este enum irá conter (um por tipo de operação identificado
// na especificação inicial e no documento de requisitos):
//   entrada, venda, troca, saidaCondicional, saidaProgramada, devolucao,
//   perda, danificado, transferencia, ajuste.
//
// Este enum será usado por:
//   - lib/models/movimentacao.dart (campo `tipo`);
//   - lib/services/estoque_service.dart, no método que aplica o efeito de
//     cada tipo sobre a quantidade em estoque (soma ou subtrai conforme o
//     tipo, via switch/when sobre este enum).
