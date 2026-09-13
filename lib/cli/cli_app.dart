// lib/cli/cli_app.dart
//
// Classe de composição da aplicação CLI: recebe (via injeção de
// dependência, a partir de bin/estoque_cli.dart) todas as instâncias de
// services já prontas, e mantém o estado de sessão atual (qual Usuario
// está logado no momento).
//
// O que este arquivo irá conter:
//   - referência ao Usuario atualmente logado;
//   - método para trocar de sessão (logout + novo login), usado no fluxo
//     de "login-switching" entre Funcionário e Administrador;
//   - método `iniciar()` que dispara o fluxo de login
//     (menu_login.dart) e, em seguida, o loop de menu_principal.dart.
//
// Este arquivo não implementa telas nem regras de negócio — é a "cola"
// entre a inicialização (bin/) e os menus (demais arquivos de lib/cli/).
