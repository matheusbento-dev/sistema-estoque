// bin/estoque_cli.dart
//
// Ponto de entrada (entrypoint) da aplicação. É o único arquivo dentro de
// bin/, conforme a convenção padrão de projetos Dart (bin/ deve conter
// apenas o(s) executável(is), nunca lógica de negócio).
//
// Responsabilidades que este arquivo terá:
//   1. Abrir a conexão com o banco de dados MySQL (via
//      lib/database/database_connection.dart), respeitando RNF-04
//      (banco local, sem integração com sistema comercial externo).
//   2. Instanciar a cadeia repository -> service para cada módulo
//      (produtos, estoque, movimentações, etc.) e injetá-la na camada CLI.
//   3. Iniciar o fluxo de login (lib/cli/menu_login.dart), que define se o
//      usuário autenticado é Funcionário ou Administrador (RF-USR-02).
//   4. Chamar o loop principal do menu (lib/cli/menu_principal.dart) até o
//      usuário optar por sair.
//   5. Garantir o encerramento correto da conexão com o banco ao final da
//      execução (inclusive em caso de erro não tratado).
//
// Este arquivo não deve conter regras de negócio nem SQL — apenas
// orquestração de inicialização (composição das dependências).
