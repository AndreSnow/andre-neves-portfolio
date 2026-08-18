# Qualidade e TDD

## Princípio

Funcionalidades e correções devem ser desenvolvidas com ciclos curtos de TDD:

```text
vermelho → escrever um teste que falha pelo motivo esperado
verde    → implementar a menor mudança que satisfaz o comportamento
refatorar → melhorar o desenho mantendo toda a suíte aprovada
```

O teste descreve comportamento observável e risco, não detalhes internos sem
valor. Código gerado por IA segue o mesmo ciclo e não recebe exceção ao quality
gate.

## Estratégia de testes

- testes unitários para regras puras, normalização e limites;
- testes de feature para rotas, formulários, persistência e respostas HTTP;
- testes de integração para MySQL, geração de PDF e armazenamento;
- poucos testes de ponta a ponta para jornadas críticas do painel e do site;
- regressões devem receber um teste que falhe antes da correção.

Testes usam dados manifestamente fictícios. Dados copiados de produção,
visitantes, contatos ou logs reais são proibidos em fixtures e snapshots.

## Segurança

TDD reduz regressões, mas não substitui revisão de segurança. Funcionalidades
sensíveis devem cobrir explicitamente:

- visitante anônimo sem acesso ao painel;
- administrador sem permissão para uma ação específica;
- validação de entradas e rejeição de payloads excessivos;
- proteção CSRF e rate limiting onde aplicável;
- sanitização de Markdown, HTML, uploads e metadados;
- impossibilidade de acessar rascunhos ou arquivos privados por URL direta;
- ausência de dados sensíveis em erros, logs e eventos analíticos;
- limites e autorização da geração de PDF.

## Cobertura

Cobertura mede linhas executadas, não a qualidade das asserções. Ela será usada
como indicador e terá um limite mínimo progressivo depois do primeiro módulo de
domínio. O limite não será reduzido para acomodar uma mudança.

No scaffold, o gate obrigatório é a aprovação integral da suíte. A primeira
feature definirá a linha de base de cobertura e registrará seu valor no CI.

## Laravel PAO

`laravel/pao` permanece como dependência exclusiva de desenvolvimento. Ele
detecta agentes de IA e transforma saídas verbosas de PHPUnit, PHPStan e Artisan
em respostas compactas e estruturadas, economizando tokens sem alterar a saída
para execuções humanas.

O PAO:

- não faz parte do artefato de produção;
- não substitui testes, análise estática ou revisão;
- não exige configuração adicional no projeto;
- não autoriza o envio de código ou dados a serviços externos.

## Quality gate

Uma pull request deve passar por:

- Laravel Pint;
- Larastan;
- migrations no MySQL 5.7 de testes;
- PHPUnit;
- build dos assets;
- auditoria de dependências PHP e JavaScript;
- detecção de segredos;
- validação das mensagens de commit.
