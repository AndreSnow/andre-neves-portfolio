# ADR-0001: monólito Laravel renderizado no servidor

## Status

Aceita

## Contexto

O produto terá páginas de conteúdo, painel administrativo, PDF e analytics. A
hospedagem compartilhada favorece PHP e MySQL, mas não garante processos
residentes ou runtime Node.js.

## Decisão

Adotar um monólito Laravel com Blade, MySQL e JavaScript progressivo somente onde
necessário. Assets frontend serão compilados pelo CI antes da publicação.

A aplicação não dependerá de SPA, API separada, containers ou filas permanentes
para funcionar em produção.

## Consequências

- implantação e operação serão compatíveis com infraestrutura simples;
- HTML renderizado no servidor beneficiará SEO e desempenho inicial;
- interface e backend evoluirão no mesmo ciclo de versão;
- interações complexas deverão justificar qualquer aumento de JavaScript;
- limitações reais da Hostinger ainda deverão ser validadas antes da implementação.
