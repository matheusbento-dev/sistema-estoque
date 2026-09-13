// lib/cli/cli_utils.dart
//
// Funções utilitárias reaproveitadas por todos os menus, para evitar
// duplicação de código de entrada/saída no terminal.
//
// O que este arquivo irá conter:
//   - leitura de entrada do usuário com validação básica (ex.: exigir
//     número inteiro, exigir texto não vazio, confirmar sim/não);
//   - exibição padronizada de listas/tabelas simples no terminal (ex.:
//     lista de produtos, lista de movimentações);
//   - exibição padronizada de mensagens de erro e de sucesso;
//   - exibição de um menu numerado genérico a partir de uma lista de
//     opções, reaproveitado por todos os menu_*.dart (evita repetir a
//     lógica de "imprimir opções + ler escolha" em cada arquivo).
//
// Este arquivo não conhece nenhuma regra de negócio — apenas
// apresentação/entrada de texto no terminal.
