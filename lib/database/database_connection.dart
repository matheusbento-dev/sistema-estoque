// lib/database/database_connection.dart
//
// Encapsula a conexão física com o MySQL. É a única parte do sistema que
// sabe "como" abrir/fechar uma conexão — os repositories recebem essa
// conexão já pronta e apenas executam queries nela.
//
// O que este arquivo irá conter:
//   - Uma classe (ex.: DatabaseConnection) responsável por:
//       * abrir a conexão usando os parâmetros de DatabaseConfig;
//       * expor um método para executar queries/comandos SQL;
//       * fechar a conexão de forma segura ao final da aplicação.
//   - Tratamento básico de erro de conexão (ex.: banco indisponível),
//     já que RNF-04 exige que o protótipo funcione com banco local, sem
//     dependência de API externa.
//
// Este arquivo não deve conter nenhuma regra de negócio nem SQL específico
// de um módulo (isso fica nos repositories) — apenas a infraestrutura de
// conexão, reaproveitada por todos os repositories via injeção de
// dependência a partir de bin/estoque_cli.dart.
