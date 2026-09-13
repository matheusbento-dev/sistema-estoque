// lib/models/produto_fornecedor.dart
//
// Representa o vínculo entre um Produto e um Fornecedor (RF-FOR-02),
// incluindo os dados que são específicos dessa combinação e não do produto
// nem do fornecedor isoladamente.
//
// Campos que este model irá conter:
//   - referência ao produto;
//   - referência ao fornecedor;
//   - código usado pelo próprio fornecedor para identificar o produto;
//   - preço de compra praticado por esse fornecedor para esse produto.
//
// Este model existe porque um mesmo produto pode ter vários fornecedores,
// cada um com seu próprio código e preço — não é um atributo simples do
// Produto nem do Fornecedor isolado.
