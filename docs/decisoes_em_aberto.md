# Decisões de modelagem em aberto

Estas três decisões ainda não foram fechadas pela equipe. Os arquivos de
código relacionados têm um comentário `// DECISÃO EM ABERTO:` apontando para
este documento — atualize os dois lados quando a equipe decidir.

## 1. Como o `Estoque` é modelado por localização

A quantidade de um produto pode estar dividida entre várias posições (loja,
depósito, prateleiras). Falta decidir se `Estoque` usa uma chave composta
(`produto_id` + `localizacao_id`) com uma linha por combinação, ou outra
estrutura. Afeta diretamente `lib/models/estoque.dart` e
`lib/repositories/estoque_repository.dart`.

## 2. Como uma `Transferência` é representada em `Movimentacao`

Uma transferência entre localizações pode ser uma única linha em
`movimentacoes` (com origem e destino) ou duas linhas linkadas (uma saída da
origem, uma entrada no destino). Afeta `lib/models/movimentacao.dart` e
`lib/services/movimentacao_service.dart`.

## 3. Se `Reserva` é uma tabela separada

O requisito RF-EST-02 exige `disponível = físico − reservado`. Falta decidir
se isso é uma tabela própria (`Reserva`, ligada a saídas programadas/
condicionais ainda não confirmadas) ou um campo calculado sem tabela
dedicada. Afeta `lib/models/reserva.dart` e `lib/services/estoque_service.dart`.
