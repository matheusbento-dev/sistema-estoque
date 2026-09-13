// lib/models/ajuste.dart
//
// Representa a correção de uma divergência de estoque (RF-AJU-01), quase
// sempre originada de um InventarioItem, mas também podendo ser um ajuste
// manual justificado.
//
// Campos que este model irá conter:
//   - referência ao produto;
//   - quantidade anterior;
//   - quantidade encontrada/nova;
//   - diferença;
//   - motivo (texto obrigatório — RF-AJU-01: "ajuste sem motivo não pode
//     ser salvo");
//   - referência ao usuário responsável pela operação (quem registrou);
//   - referência ao usuário responsável pela autorização (quem aprovou —
//     deve ter perfil administrador, RF-AJU-02);
//   - data;
//   - referência opcional ao Inventario/InventarioItem de origem, quando
//     aplicável;
//   - status (StatusOcorrencia: pendente/autorizado/rejeitado).
//
// Um Ajuste só deve refletir em Estoque (via Movimentacao do tipo `ajuste`)
// depois de autorizado — essa orquestração é responsabilidade de
// lib/services/ajuste_service.dart, não deste model.
