// lib/models/localizacao.dart
//
// Representa uma posição física de armazenamento (RF-EST-01), organizada
// hierarquicamente em setor, prateleira e posição, podendo estar na loja
// ou no depósito.
//
// Campos que este model irá conter:
//   - identificador único da localização;
//   - área (loja ou depósito);
//   - setor, prateleira, posição (conforme a organização física descrita
//     na especificação inicial).
//
// Um mesmo produto pode estar associado a mais de uma Localizacao ao mesmo
// tempo — essa associação (com a quantidade em cada uma) é modelada em
// lib/models/estoque.dart, não aqui. Este model descreve apenas o "lugar",
// não "quanto tem" nesse lugar.
//
// DECISÃO EM ABERTO: a forma exata como Estoque referencia Localizacao
// (chave composta produto+localização vs. outra estrutura) ainda não foi
// fechada pela equipe — ver docs/decisoes_em_aberto.md.
