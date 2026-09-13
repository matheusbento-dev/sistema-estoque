# estoque_cli

Protótipo acadêmico de um **sistema de controle de estoque** para uma loja
de peças e materiais, desenvolvido como projeto integrado do curso de
Ciência da Computação — **UNIFEOB (Centro Universitário)**.

## Equipe

- Matheus Sousa Bento — RA 26000291
- Vinicius Padua Rugani Paes — RA 26000211
- Matheus de Souza Pereira — RA 26000049
- Otávio Rugani Melo — RA 26001477

## Sobre o projeto

A análise feita com a empresa parceira mostrou um problema recorrente: o
estoque físico não bate com o que está registrado no sistema comercial
usado hoje, não existe rastreabilidade de quem alterou o quê, e as
autorizações de ajuste são feitas de forma verbal. Este projeto não tem
como objetivo substituir o software comercial da empresa — é um protótipo
acadêmico, com dados simulados e banco local, que propõe um **modelo de
controle de estoque** onde:

- nenhuma quantidade em estoque muda sem um registro de movimentação;
- toda operação relevante tem um responsável identificado;
- divergências entre o físico e o sistema geram uma ocorrência para
  análise **antes** de qualquer ajuste;
- ajustes de estoque exigem autorização de um usuário com permissão
  administrativa;
- o histórico de operações nunca é apagado — produtos com movimentações
  são inativados, nunca excluídos fisicamente.

O escopo completo dos problemas identificados e das regras propostas está
documentado na Especificação Inicial do projeto e no Documento de
Requisitos Funcionais e Não Funcionais (RF-XXX / RNF-XX), que servem de
base direta para os comentários explicativos deixados em cada arquivo
deste repositório.

## O que o sistema faz (e o que não faz)

**Faz:**
produtos, estoque por localização (loja/depósito/posição), movimentações
de estoque (entrada, venda, troca, saída condicional/programada,
devolução, perda, dano, transferência, ajuste), fornecedores (com vínculo
produto-fornecedor), entradas de mercadoria , inventário
periódico com tratamento formal de divergências, ajustes autorizados,
vendas simplificadas, usuários com dois perfis de acesso (Funcionário e
Administrador) e notificações internas (alertas visuais).

**Não faz** (fora de escopo, deliberadamente):
sistema financeiro, sistema completo de vendas, gestão financeira de
fornecedores, CRM, emissão fiscal completa, integração com o sistema
comercial já usado pela empresa, automação de compras.

Relatórios e dashboards **não** são telas do aplicativo: são construídos
no **Power BI**.
## Arquitetura e tecnologias

- **Linguagem:** Dart, aplicação de **linha de comando (CLI)** — sem
  interface gráfica.
- **Banco de dados:** MySQL, local, sem integração com sistemas externos.
- **Conexão:** o aplicativo conecta diretamente ao MySQL, sem servidor/API
  intermediário. As regras de negócio ficam centralizadas na camada de
  serviço interna da aplicação (`lib/services/`), justamente para não
  perder rastreabilidade nem controle de permissões mesmo sem uma API
  separada.
- **Notificações:** apenas alertas visuais dentro do próprio aplicativo,
  usando um mecanismo de "login-switching" (o funcionário sai, o
  administrador loga e vê o que está pendente) — não há e-mail, push nem
  servidor rodando em segundo plano.
- **Relatórios:** Power BI, fora do aplicativo.

### Camadas do código (padrão repository / service)

```
Camada CLI (lib/cli/)         → interação com o usuário no terminal
        ↓
Camada Service (lib/services/) → validações e regras de negócio
        ↓
Camada Repository (lib/repositories/) → tradução para SQL
        ↓
Camada Database (lib/database/) → conexão física com o MySQL
```

Os **models** (`lib/models/`) são objetos de dados puros — não têm lógica
de negócio, apenas representam as entidades.

## Estrutura de pastas

```
estoque_cli/
├── bin/
│   └── estoque_cli.dart        # ponto de entrada da aplicação
├── lib/
│   ├── database/                # configuração e conexão com o MySQL
│   ├── models/                  # entidades e enums do domínio
│   │   └── enums/
│   ├── repositories/             # acesso a dados (SQL), sem regra de negócio
│   ├── services/                 # validações e regras de negócio
│   └── cli/                      # menus e interação com o terminal
├── docs/
│   └── decisoes_em_aberto.md    # decisões de modelagem ainda não fechadas
├── pubspec.yaml
├── .gitignore
└── README.md
```

Cada arquivo `.dart` deste repositório contém, no topo, um comentário
explicando sua responsabilidade específica e a quais requisitos (RF-XXX /
RNF-XX) ele atende — **por enquanto, apenas os comentários e a estrutura
foram criados, sem implementação de código**, servindo como planejamento
da arquitetura antes do início da codificação.

## Estado atual

O projeto está na fase de planejamento da arquitetura de código, após a
conclusão da modelagem de dados (modelo relacional com as entidades e
relacionamentos do domínio). Há três decisões de modelagem ainda em
aberto, documentadas em [`docs/decisoes_em_aberto.md`](docs/decisoes_em_aberto.md).
