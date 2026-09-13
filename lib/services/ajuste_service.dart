// lib/services/ajuste_service.dart
//
// Regras de negócio do módulo de ajustes (RF-AJU-01/02) — o único ponto do
// sistema autorizado a corrigir uma divergência de estoque.
//
// O que este arquivo irá conter:
//   - criação de um ajuste a partir de um InventarioItem pendente ou de
//     forma manual, exigindo sempre um motivo (RF-AJU-01: sem motivo, não
//     salva);
//   - autorização do ajuste: exige perfil Administrador
//     (auth_service.exigirAdministrador — RF-AJU-02) antes de:
//       1. mudar o status do ajuste para `autorizado`;
//       2. gerar uma Movimentacao do tipo `ajuste` via
//          movimentacao_service, que por sua vez reflete a nova
//          quantidade em Estoque;
//   - rejeição do ajuste: apenas muda o status, sem alterar estoque.
