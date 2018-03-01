---
title: API - Sofia | Versão 1.0.0

language_tabs:
  - shell
  - python

toc_footers:
  - <a href='https://github.com/willcode-labs/sofia'>Repositório do projeto</a>

includes:
  - errors

search: true
---

# Introdução

Projeto de sistema integrado para comercio digital [CODINOME Sofia].

Modulo: Core

Api desenvolvida visando o padrão REST.

# Ambiente

Lista de ambientes da API.

| Domínio/Subdomínio | Tipo |
| --- | --- |
| https://XXXXXXXXXX | DSV |
| https://XXXXXXXXXX | HLG |
| https://XXXXXXXXXX | PROD |

# Configuração

TODO

Lista das configurações:

| Nome | Valor | Descrição |
| --- | --- | --- |
| | | |

# 1. Verificação

> Verificação de usuário e geração do primeiro TOKEN de autenticação:

```shell
curl 
  -H "Content-Type: application/json"
  -H "X-TOKEN: XXXXXX"
  -X POST
  XXXXXX/api/v1/auth/verify/
}
```

```python
# TODO
```

> Substitua as variáveis **XXXXXX** para obter um resultado.

<aside class="notice">EndPoint: /api/v1/auth/verify/</aside>
<aside class="success">HTTP: POST</aside>

Rota para validar usuário, sempre que um novo usuário é criado, um email com o link
de validação é encaminhado para o email de cadastro.

Nenhuma operação funcionará até que o usuário esteja validado.

# 2. Autenticação

> Obtendo o TOKEN de autenticação:

```shell
curl 
  -d '{"username":"XXXXXX","password":"XXXXXX"}'
  -H "Content-Type: application/json"
  -H "X-APIKEY: XXXXXX"
  -X POST
  XXXXXX/api/v1/auth/login/
}
```

```python
# TODO
```

> Substitua as variáveis **XXXXXX** para obter um resultado.

<aside class="notice">EndPoint: /api/v1/auth/login/</aside>
<aside class="success">HTTP: POST</aside>

TODO
