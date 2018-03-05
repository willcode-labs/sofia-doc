---
title: API - Sophia | Versão 1.0.0

language_tabs:
  - shell
  - python

toc_footers:
  - <a href='https://github.com/willcode-labs/sophia'>Repositório do projeto</a>

includes:
  - errors

search: true
---

# Introdução

Projeto de sistema integrado para comercio digital [CODINOME Sophia].

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

## RN01 - Verificação e Autenticação

A loja deverá ter um formulário de cadastro, para novos usuários, todo novo usuário
deverá ter o perfil de cliente **CLIENT**.

Apos o cadastro de nome, email, usuário e senha, um email será disparado para o novo
usuário, nele conterá um link de verificação.

Para usuários não verificados, nenhuma opção estará disponivel.
Para usuário verificados estará habilitado as funcionalidades do sistema.

A autenticação será sempre por usuário e senha, mais sua **APIKEY**.

<aside class="notice">
<strong>APIKEY</strong> Chave que identifica o perfil de acesso de um usuário, ela pode ser
ativada/desativada conforme necessidade. Existem três tipos de perfis: 
<strong>ROOT</strong>, <strong>DIRETOR</strong> e <strong>CLIENT</strong>.
</aside>

São três tipos de perfil para **APIKEY**: **ROOT**, **DIRECTOR** e **CLIENT**.

<aside class="notice">
    <strong>Perfil ROOT</strong> Utilizado somente no sistema <strong>Charlotte</strong>, que fará a 
gestão de clientes do sistema, controlando recursos, custos, financeiro e ativação/desativação
do sistema.
</aside>

<aside class="notice">
    <strong>Perfil DIRECTOR</strong> Utilizado somente no sistema <strong>Saphira</strong>, responsável
pela área administrativa da loja do cliente, controlando recursos como cadastro de produtos,
controle de pedidos e etc.
</aside>

<aside class="notice">
    <strong>Perfil CLIENT</strong> Utilizado somente no sistema da <strong>LOJA</strong>, responsável
por todas as funcionalidades do usuário, como carrinho de compras, atualização de cadastro e etc.
</aside>

Cada EndPoint da API será limitada para um ou mais tipos de perfil de **APIKEY**.

Para áreas administrativas e funcionalidades especificas do sistema sempre será
utilizada uma **APIKEY** do tipo **ROOT** ou **DIRECTOR**.

O sistema deverá armazenar em sessão o **TOKEN** de autenticação dos usuários.

<aside class="notice">
<strong>TOKEN</strong> Gerado pela primeira vez na verificação de usuário, e posteriormente
sempre atualizado nas demais requisições. Se o token não estiver expirado não será
substituído, somente renovado a data de expiração. Para cada autenticação um novo token será gerado.
Podem haver multiplos token para um mesmo usuário, desde que sejam com IPs diferentes, caso contrário
uma exceção impedirá o acesso.
</aside>

## RN02 - Cadastro simples de cliente

Uma api para cadastro simples de cliente, onde apenas os dados **nome**, **CPF** e **email**
serão requeridos.

Este simples cadastro tem o objetivo de liberar o cliente ou visitante rapidamente
para uma compra.

A api ainda enviará um email de verificação de autenticidade para o email cadastro,
com o link de verificação.

Usuários não verificados não poderam efetuar nenhuma ação de compra ou gerenciável
sem antes estár devidamente verificado.

Evidentemente antes de concluir sua primeira compra, um endereço de entrega/cobrança
deverá ser cadastrado.

# Configuração

Lista das configurações:

| Nome | Valor | Descrição |
| --- | --- | --- |
| token_time_client | 60 | Tempo em minutos para expiração do token de perfil **CLIENT**. |
| token_time_admin | 10080 | Tempo em minutos para expiração do token de perfis **DIRECTOR** e **ROOT**. |
| query_row_limit | 20 | Default para total de registros retornados em uma consulta. |
| order_expired_in_hour | 24 | Tempo de expiração de um pedido em um carrinho de compras. |

# EndPoints

A API contem regras para os principais tipos de requisição PHP.

| Tipo | Parâmetro | Retorno |
| --- | --- | --- |
| GET | Query String(?pizza=calabresa) | JSON |
| POST | JSON | JSON |
| PUT | JSON | JSON |
| DELETE | JSON | JSON |

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

<aside class="success">
    <strong>ENDPOINT:</strong> /api/v1/auth/verify/
</aside>

| Nome | Valor |
| --- | --- |
| **HTTP METHOD** | POST |
| **PROFILE_ID** | CLIENT [1] |

Rota para validar usuário, sempre que um novo usuário é criado, um email com o link
de validação é encaminhado para o email de cadastro.

Nenhuma operação funcionará até que o usuário esteja validado.

### 1.1 Parâmetros

Soliciação por POST.

| Nome | Tipo | Método | Obrigatório | Descrição |
| --- | --- | --- | --- | --- |
| token | string | HEADER | SIM | Token gerado no cadastro, utilizado somente uma vez para verificação. |

### 1.2 Retorno

Retorno em format JSON.

| Nome | Tipo | HTTP | Descrição |
| --- | --- | --- | --- |
| token | string | 200 | Token atualizado, utilizar para as próximas requisições. |
| date_expire | string date(%Y-%m-%d %H:%M:%S) | 200 | Data de expiração do token. |

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

<aside class="success">
    <strong>ENDPOINT:</strong> /api/v1/auth/login/
</aside>

| Nome | Valor |
| --- | --- |
| **HTTP METHOD** | POST |
| **PROFILE_ID** | CLIENT [1] |

Para efetuar uma autenticação de usuário basta passar os paramêtros de usuário e senha,
junto com uma APIKEY, que juntos identificam o perfil de acesso.

Se a autenticação for válida, um token será retornado.

### 1.1 Parâmetros

Soliciação por POST.

| Nome | Tipo | Método | Obrigatório | Descrição |
| --- | --- | --- | --- | --- |
| username | string | POST | SIM | Username do comprador. |
| password | string | POST | SIM | Password do comprador. |
| apikey | string | HEADER | SIM | Apikey que identifica o perfil do comprador como **CLIENT**. |

### 1.2 Retorno

Retorno em format JSON.

| Nome | Tipo | HTTP | Descrição |
| --- | --- | --- | --- |
| token | string | 200 | Token atualizado, utilizar para as próximas requisições. |
| date_expire | string date(%Y-%m-%d %H:%M:%S) | 200 | Data de expiração do token. |