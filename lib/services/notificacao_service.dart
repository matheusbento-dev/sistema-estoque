// lib/services/notificacao_service.dart
//
// Centraliza a lógica de alertas visuais dentro da aplicação (RF-NOT-01/
// 02/03). Decisão da equipe: sem servidor, sem push/e-mail — as
// notificações são consultas ao estado atual do banco, exibidas quando o
// usuário certo está logado ("login-switching": funcionário sai,
// administrador entra e vê o que está pendente).
//
// O que este arquivo irá conter:
//   - verificação de produtos com quantidade disponível abaixo do mínimo
//     (RF-NOT-01), consultando estoque_service;
//   - verificação de divergências de inventário pendentes (RF-NOT-02),
//     consultando inventario_repository;
//   - verificação de ajustes aguardando autorização (RF-NOT-03),
//     consultando ajuste_repository;
//   - um método único (ex.: `buscarAlertasPara(Usuario)`) que a camada CLI
//     chama ao logar um Administrador, retornando a lista consolidada de
//     alertas relevantes para aquele perfil.
