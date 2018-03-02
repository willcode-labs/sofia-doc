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

# Regras de negócio

Regras e definições de negocio estarão disponíveis neste tópico.

## 1. RN01 - Verificação e Autenticação

A loja deverá ter um formulário de cadastro, para novos usuários, todo novo usuário
deverá ter o perfil de cliente **CLIENT**.

Apos o cadastro de nome, email, usuário e senha, um email será disparado para o novo
usuário, nele conterá um link de verificação.

Para usuários não verificados, nenhuma opção estará disponivel.
Para usuário verificados estará habilitado as funcionalidades do sistema.

A autenticação será sempre por usuário e senha, mais sua **APIKEY**.

<aside class="notice">
<strong>APIKEY</strong> É uma chave que identifica o perfil de acesso de um usuário, ela pode ser
ativada/desativada conforme necessidade.
</aside>

São três tipos de perfil para **APIKEY**: **ROOT**, **DIRECTOR** e **CLIENT**.

Cada EndPoint da API será limitada para um ou mais tipos de perfil de **APIKEY**.

Para áreas administrativas e funcionalidades especificas do sistema sempre será
utilizada uma **APIKEY** do tipo **ROOT** ou **DIRECTOR**.

Especificamente para autenticação e verificação de usuário será sempre uma
**APIKEY** do tipo **CLIENT**.

O sistema deverá armazenar em sessão o **TOKEN** de autenticação dos usuários.

# Configuração

TODO

Lista das configurações:

| Nome | Valor | Descrição |
| --- | --- | --- |
| | | |

# EndPoints

## 1. Verificação

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

## 2. Autenticação

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

Para efetuar uma autenticação de usuário basta passar os paramêtros de usuário e senha,
junto com uma APIKEY, que juntos identificam o perfil de acesso.

Se a autenticação for válida, um token será retornado.
