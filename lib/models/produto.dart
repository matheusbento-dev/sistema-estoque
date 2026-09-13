// lib/models/produto.dart
//
// Representa um produto comercializado pela loja (RF-PROD-01/02/03).
//
// Campos que este model irá conter:
//   - código interno (identificador único, usado em buscas exatas);
//   - código de barras (opcional — decisão da equipe: código interno +
//     código de barras opcional, em vez de um único campo ambíguo);
//   - nome, descrição, descrição de funcionamento;
//   - foto_url (String) — decisão da equipe: caminho/URL da imagem com
//     convenção de nomenclatura de arquivo, em vez de armazenar BLOB no
//     banco;
//   - unidade de medida;
//   - parâmetro de estoque mínimo (RF-EST-03);
//   - flag de inativação (booleano) — em vez de exclusão física, conforme
//     RF-PROD-03 e RNF-02 (produtos com histórico nunca são apagados,
//     apenas inativados).
//
// Este model é um objeto de dados puro (sem lógica de negócio): nenhuma
// validação ou regra fica aqui — isso é responsabilidade de
// lib/services/produto_service.dart.
