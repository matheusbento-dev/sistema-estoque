// lib/models/inventario_item.dart
//
// Representa a conferência de um único produto dentro de um Inventario
// (RF-INV-01/02).
//
// Campos que este model irá conter:
//   - referência ao inventário;
//   - referência ao produto (e, possivelmente, à localização conferida);
//   - quantidade registrada no sistema no momento da conferência;
//   - quantidade encontrada fisicamente;
//   - diferença calculada (encontrada − registrada);
//   - status da ocorrência (StatusOcorrencia — consistente
//     automaticamente quando a diferença é zero; pendente quando há
//     divergência, aguardando análise, conforme RF-INV-02).
//
// Regra de negócio importante: quando há divergência, este item NÃO altera
// a quantidade em Estoque sozinho — ele apenas gera a ocorrência pendente.
// A alteração real só acontece via lib/models/ajuste.dart, depois de
// autorizado (RF-AJU-01/02).
