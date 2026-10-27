# estoque_cli — Sistema de Controle de Estoque

Protótipo acadêmico (Projeto Integrado — Ciência da Computação, UNIFEOB) de um
sistema de controle de estoque para uma loja de peças agrícolas.

Aplicação de **terminal** em **Dart**, conectada **diretamente** ao **MySQL**
(sem servidor/API intermediário).

**Equipe:** Matheus Sousa Bento (RA 26000291) · Vinicius Padua Rugani Paes
(RA 26000211) · Matheus de Souza Pereira (RA 26000049) · Otávio Rugani Melo
(RA 26001477)

---

## 1. A ideia central

O problema da loja não era "não ter um número de estoque" — era não saber
**de onde esse número veio**. Quando a contagem não batia, a quantidade era
simplesmente sobrescrita, e ninguém sabia quem mudou, quando, nem por quê.

Por isso o sistema segue uma regra só:

> **Nada muda no estoque sem um QUEM, um PORQUÊ e um HISTÓRICO.**

| Pergunta | Como o sistema responde |
|---|---|
| **Quem?** | O usuário logado é gravado em toda operação. Ninguém digita "quem é": o sistema sabe pelo login. |
| **Por quê?** | Toda movimentação exige um **motivo** escrito (o banco recusa se não ouver nada). |
| **Quando?** | Data/hora gravada pelo próprio MySQL. |
| **Histórico?** | A tabela `movimentacoes` **nunca é alterada nem apagada** (triggers bloqueiam). Erro se corrige com uma **nova** movimentação. |

---

## 2. Como rodar

### Pré-requisitos

- **Dart SDK 3.3+** (`dart --version`)
- **MySQL 8** (+ MySQL Workbench, opcional)


A aplicação conecta como:

| Usuário MySQL | Senha | Host |
|---|---|---|
| `Seu_usuario` | `Sua senha` | `127.0.0.1` |


### Passo 1 — criar / RESETAR o banco (quantas vezes quiser)

Os dois scripts deixam tudo na **estaca zero** toda vez que rodam:

| Arquivo | O que faz |
|---|---|
| `01_schema.sql` | **apaga** o `estoque_db` inteiro e cria de novo, vazio |
| `02_dados_simulados.sql` | **esvazia** todas as tabelas e carrega os dados de exemplo |

Reset completo (estrutura + dados), sempre nesta ordem:

```bash
mysql -u seu_usuario -p -h 127.0.0.1 < database/01_schema.sql
mysql -u seu_usuario -p -h 127.0.0.1 < database/02_dados_simulados.sql
```

Só voltar os dados ao início (estrutura não mudou): basta o `02`.

No **Workbench**: `File > Open SQL Script...` → abrir o arquivo → raio
**sem** cursor (`Ctrl+Shift+Enter`, executa o arquivo inteiro). Depois
clicar em 🔄 na lista de schemas.

### Passo 2 — rodar a aplicação

Na pasta do projeto:

```bash
dart pub get
dart run
```

### Usuários de teste (login no sistema)

| Login | Senha | Perfil |
|---|---|---|
| `admin` | `admin123` | Administrador |
| `joao` | `1234` | Funcionário |
| `maria` | `1234` | Funcionário |
| `pedro` | `1234` | Funcionário **inativo** (não entra; o histórico dele continua no banco) |

---

## 3. Perfis: quem faz o quê

| Funcionalidade | Funcionário | Admin |
|---|:---:|:---:|
| Consultar saldo (por produto, por local, totais) | ✅ | ✅ |
| Entrada, saída, transferência | ✅ | ✅ |
| Ajuste manual / ajuste de divergência (com motivo) | ✅ | ✅ |
| Inventário (abrir, contar, fechar) | ✅ | ✅ |
| Cadastro de produtos, localizações, fornecedores | ✅ | ✅ |
| **Notificações** | ❌ | ✅ |
| **Histórico de movimentações (logs de estoque)** | ❌ | ✅ |
| **Logs do sistema** (logins, cadastros, inventários) | ❌ | ✅ |
| **Auditoria** saldo × histórico | ❌ | ✅ |
| **Gerenciar usuários** | ❌ | ✅ |

Resumindo: **o funcionário faz; o admin acompanha.**

A barreira de permissão está nos **serviços** (`sessao.exigirAdmin()`), não só
na tela. Mesmo que um menu fosse mostrado por engano, a operação seria recusada.


## 4. Arquitetura

```
bin/
  estoque_cli.dart          ponto de entrada (só chama App)
lib/
  config/config.dart        dados de conexão e parâmetros (dias, limites)
  database/banco.dart       conexão única, execução de SQL, transações
  models/                   objetos de dados puros + enums (sem regra)
  repositories/             SQL puro: traduz banco <-> Dart (sem regra)
  services/                 REGRAS DE NEGÓCIO e permissões
  cli/                      telas: só print/stdin, chamam serviços
  util/formatacao.dart      datas no formato brasileiro
  util/excecoes.dart        exceções de regra de negócio (usadas por modelos e serviços)
database/
  01_schema.sql             reseta: apaga e recria banco, tabelas e triggers
  02_dados_simulados.sql    reseta os dados: esvazia e carrega o exemplo
docs/
  decisoes.md               o que foi simplificado e por quê
  requisitos_revisados.md   situação de cada RF/RNF após a simplificação
```

### Regra das camadas

```
   cli  ──chama──▶  services  ──chama──▶  repositories  ──SQL──▶  MySQL
 (tela)          (regras/permissão)      (só tradução)
```

- **Telas** nunca escrevem SQL e nunca decidem regra.
- **Repositórios** nunca decidem regra: só executam SQL.
- **Serviços** decidem tudo: validação, permissão, transação.

### Encapsulamento (POO) — `lib/models/produto.dart`

O `Produto` guarda seus atributos como **privados** (`_nome`,
`_estoqueMinimo`...) e só os expõe por **getters** (`produto.nome`). Não há
setters livres: a alteração é feita por **métodos com nome de ação** que
validam antes de gravar:

| Método | Garante |
|---|---|
| `renomear(nome)` | nome não vazio, até 120 caracteres |
| `alterarDescricao(texto)` | até 255 caracteres; vazio vira `null` |
| `alterarUnidade(unidade)` | não vazia, até 10 caracteres, maiúsculas |
| `alterarEstoqueMinimo(n)` | nunca negativo |
| `inativar()` / `reativar()` | não inativa o que já está inativo (e vice-versa) |
| `Produto.novo(...)` | produto novo já nasce válido e ativo |

Se o valor for inválido, o método lança `RegraNegocioException` **antes** de
mudar o atributo — então nunca existe um `Produto` em estado inválido.
Regras que dependem do banco (código repetido, saldo antes de inativar)
ficam no `ProdutoService`.

### Caminho de uma SAÍDA, passo a passo

1. `MenuMovimentacao._saida()` pergunta produto, local, quantidade e motivo.
2. Chama `EstoqueService.registrarSaida(...)`.
3. O serviço confere se produto/local estão ativos e chama o núcleo
   `_movimentarPorIds`, que:
   - exige o motivo (o **porquê**) e pega o usuário da sessão (o **quem**);
   - abre uma **transação**;
   - lê o saldo com `FOR UPDATE` (trava a linha) e confere se há quantidade;
   - subtrai do saldo (`EstoqueRepository.somar`);
   - grava a linha em `movimentacoes`;
   - **COMMIT**. Se qualquer passo falhar → **ROLLBACK** (nada é gravado).
4. A tela mostra o saldo resultante.

O método `_movimentarPorIds` do `EstoqueService` é o **único** lugar do
programa que altera a tabela `estoque`.

---

## 5. Modelo de dados (9 tabelas)

| Tabela | Para quê |
|---|---|
| `usuarios` | login, senha (texto simples), perfil FUNCIONARIO/ADMIN, ativo |
| `produtos` | código, nome, unidade, estoque mínimo, ativo |
| `fornecedores` | nome, CNPJ, telefone |
| `localizacoes` | nome descritivo ("Loja - Setor A - Prateleira 1") + tipo LOJA/DEPOSITO |
| `estoque` | **saldo atual** por (produto, localização) — chave composta |
| `movimentacoes` | **o histórico**: ENTRADA, SAIDA, TRANSFERENCIA, AJUSTE |
| `inventarios` + `inventario_itens` | contagens físicas e divergências |
| `logs_sistema` | ações que não mexem em quantidade (login, cadastros...) |

### Os 4 tipos de movimentação

| Tipo | Origem | Destino | Observação |
|---|:---:|:---:|---|
| ENTRADA | – | ✔ | exige fornecedor; NF opcional |
| SAIDA | ✔ | – | o motivo diz se foi venda, perda, avaria... |
| TRANSFERENCIA | ✔ | ✔ | uma linha só; o total do produto não muda |
| AJUSTE | – | ✔ | guarda quantidade **anterior** e **nova** |

O banco confere esse formato com a `CHECK ck_mov_formato`.

---

## 6. As camadas de proteção do histórico

1. **Serviço**: saldo só muda junto com a movimentação, na mesma transação.
2. **Motivo obrigatório**: na aplicação **e** no banco (`CHECK`).
3. **Triggers**: `UPDATE`/`DELETE` em `movimentacoes` e `logs_sistema` são
   recusados pelo próprio MySQL.
4. **Nenhuma exclusão no código**: não existe `DELETE` em nenhum repositório.
   Produtos, usuários, locais e fornecedores são **inativados**.
5. **Auditoria**: o admin pode recalcular todos os saldos a partir do
   histórico e conferir que batem.

---

## 7. Notificações (só admin)

Substituem a antiga "autorização de ajuste".

- **Antes:** o funcionário pedia, o admin aprovava, só então o estoque mudava.
- **Agora:** o funcionário faz (com motivo), e o admin é **avisado** e confere.

| Notificação | Some quando... |
|---|---|
| Divergência de inventário sem ajuste | alguém registra o ajuste da divergência |
| Produto abaixo do estoque mínimo | o total volta a ficar acima do mínimo |
| Ajuste realizado nos últimos 7 dias | passam 7 dias (`Config.diasAjustesRecentes`) |
| Produto sem movimentação há 90+ dias | o produto se movimenta (`Config.diasProdutoParado`) |

As notificações **não são gravadas** em tabela: são **calculadas** por
consultas toda vez que o admin entra ou abre a tela. Por isso nunca ficam
desatualizadas e não precisam de controle de "lida".

Como não há servidor, não existe "push": o admin vê as pendências **ao fazer
login** e no menu Administração. O programa permite trocar de usuário sem
fechar (logout → login), o que basta para demonstrar o fluxo.

---

## 8. Inventário

1. **Abrir** (só um aberto por vez).
2. **Contar**: para cada produto/local, o sistema "fotografa" o saldo e grava
   junto com o número contado. O saldo do sistema **não** é mostrado antes da
   contagem, para não influenciar quem conta. Pode recontar enquanto estiver
   aberto (a nova contagem substitui a anterior).
3. **Fechar**: contagens ficam definitivas. Diferença 0 = consistente;
   diferença ≠ 0 = **divergência**.
4. **Ajustar** cada divergência, com motivo. O ajuste aplica a **diferença**
   sobre o saldo **atual** (e não "força" o número contado), porque entre a
   contagem e o ajuste pode ter havido vendas.

O inventário **nunca** altera o saldo sozinho.

---

## 9. Simplificações e limitações conhecidas

Detalhes em [`docs/decisoes.md`](docs/decisoes.md). Em resumo:

- **Sem módulo de vendas/clientes**: venda é um *motivo* de saída.
- **Sem reservas / saída programada / condicional**: físico = disponível.
- **Sem autorização de ajuste**: controle por notificação + histórico.
- **Senha em texto simples** (sem hash): decisão consciente de protótipo.
  Num sistema real, seria obrigatório usar hash (ex.: bcrypt/argon2).
- **Interface só com `print`/`stdin`**, sem biblioteca de CLI.
- **Relatórios/Power BI** fora do escopo da aplicação.

---

## 10. Problemas comuns
**Erro de autenticação / "caching_sha2_password" / SSL**
O MySQL 8 exige conexão segura para esse tipo de senha, e a aplicação já
conecta com SSL (`Config.usarSsl = true`). Se o seu MySQL estiver sem SSL,
uma alternativa (MySQL 8.0) é, como root


**Acentos estranhos no Windows**
Antes de rodar, execute `chcp 65001` no terminal (muda para UTF-8), ou use o
Windows Terminal.

**Tela não limpa / aparecem códigos estranhos (`←[2J`)**
Terminal antigo sem suporte a cores ANSI. Use o Windows Terminal (padrão no
Windows 11)

**MySQL em outra porta / outro usuário**
Altere `lib/config/config.dart`.

---

## 11. Sobre os dados simulados

O saldo gravado em `estoque` no `02_dados_simulados.sql` é exatamente a soma
de todas as movimentações do histórico. Por isso a **Auditoria** do admin
sempre fecha com os dados de exemplo. Para conferir direto no Workbench, há
uma consulta comentada no fim do próprio arquivo.