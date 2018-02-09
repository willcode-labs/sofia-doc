---
title: API - Sofia | Versão 1.0.0

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='https://github.com/willcode-labs/sofia'>Repositorio do projeto</a>

includes:
  - errors

search: true
---

# Introdução

Documentação da api do projeto Sofia.

A api foi desenvolvida visando o padrão REST.

# 1. Autenticação

> Obtendo o TOKEN de autenticação:

```shell
curl 
  -d "login={login}&senha={senha}&user_type={user_type}"
  -H "Content-Type: application/x-www-form-urlencoded"
  -H "X-APIKEY: {APIKEY}"
  -X POST
  {api-host}/v1/auth/login
}
```

```python
# TODO
```

> Substitua as variáveis entre **{}** para obter um resultado.

<aside class="notice">EndPoint: /v1/auth/login</aside>
<aside class="success">HTTP: POST</aside>

O WS contem um sistema interno de armazenamento e controle das APIKEY, identificando
a origem e tipos de usuários que podem acessar.

Para identificar os tipos de usuários que uma APIKEY possui, deve-se consultar
a tabela `app` ou junto a equipe de TI.

O login e senha são os mesmos utilizados no portal SIGA ou Portal acadêmico, contendo
as mesmas regras e permissões.

A senha contém uma medida de segurança a mais, fazendo necessário codificar para base64
antes de submeter para a API.

Alem da autenticação na API, uma sessão é disponibilizada, a mesma criada pelo SIGA.

Se tudo correr bem, o resultado será um TOKEN, que será utilizado por todas
as rotas da api, para validação e autenticação.
