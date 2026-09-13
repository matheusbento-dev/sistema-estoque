// lib/database/database_config.dart
//
// Guarda os parâmetros de conexão com o MySQL (host, porta, usuário, senha,
// nome do schema) em um único lugar, separados do código que efetivamente
// abre a conexão.
//
// O que este arquivo irá conter:
//   - Uma classe simples (ex.: DatabaseConfig) com os campos de conexão.
//   - Valores padrão para ambiente de desenvolvimento/demonstração
//     acadêmica (RNF-05: volume pequeno, cenário de apresentação).
//   - Um mecanismo para sobrescrever os valores padrão sem versionar
//     credenciais reais (ex.: leitura de variáveis de ambiente ou de um
//     arquivo local ignorado pelo Git — ver .gitignore:
//     lib/database/database_config.local.dart).
//
// Este arquivo nunca deve conter senha real de produção — apenas valores de
// desenvolvimento/demo do protótipo acadêmico.
