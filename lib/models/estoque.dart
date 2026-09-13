// lib/models/estoque.dart
//
// Representa a quantidade de um produto em uma localização específica
// (RF-EST-01) e a distinção entre quantidade física e quantidade
// disponível (RF-EST-02: disponível = físico − reservado).
//
// Campos que este model irá conter:
//   - referência ao produto;
//   - referência à localização;
//   - quantidade física naquela posição;
//   - quantidade reservada naquela posição (originada de saídas
//     programadas/condicionais ainda não confirmadas);
//   - quantidade disponível (calculada: física − reservada — pode ser um
//     getter calculado em vez de campo persistido, a definir).
//
// A quantidade TOTAL de um produto (somando todas as localizações) não é
// um campo aqui — é responsabilidade de
// lib/repositories/estoque_repository.dart somar as linhas de Estoque de
// um mesmo produto, e/ou de lib/services/estoque_service.dart expor esse
// total já calculado para a camada CLI.
//
// DECISÃO EM ABERTO: se a chave é composta (produto_id + localizacao_id,
// uma linha por combinação) ou outra estrutura — ver
// docs/decisoes_em_aberto.md. Também está em aberto se "reservado" vem de
// uma tabela própria (Reserva) ou de um campo aqui mesmo.
