/// Fornecedor (RF-FOR). Aparece apenas nas ENTRADAS de mercadoria.
class Fornecedor {
  final int id;
  final String nome;
  final String? cnpj;
  final String? telefone;
  final bool ativo;

  const Fornecedor({
    required this.id,
    required this.nome,
    this.cnpj,
    this.telefone,
    required this.ativo,
  });
}
