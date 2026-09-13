// lib/cli/menu_principal.dart
//
// Menu raiz exibido após o login, com as opções disponíveis dependendo do
// perfil do usuário logado (Funcionário vê menos opções que Administrador,
// conforme RF-USR-03).
//
// O que este arquivo irá conter:
//   - loop principal (`while`) que exibe as opções e direciona para o
//     submenu correspondente (produtos, estoque, entradas, fornecedores,
//     inventário, ajustes, vendas, usuários), até o usuário escolher sair;
//   - ao logar como Administrador, chama notificacao_service para exibir
//     de imediato os alertas pendentes (RF-NOT-01/02/03) antes do menu;
//   - opção de logout, que retorna para menu_login.dart (suporte ao fluxo
//     de login-switching).
//
// Este arquivo não implementa a lógica de cada submenu — apenas a
// navegação entre eles.
