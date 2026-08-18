# ADR-0004: stack inicial de desenvolvimento e testes

## Status

Aceita

## Contexto

A produção oferece PHP 8.5 e utiliza MariaDB gerenciado pela Hostinger, mas sua
versão exata não foi identificada. Dois projetos existentes do mesmo proprietário
operam corretamente nesse ambiente depois de serem desenvolvidos e testados com
MySQL 5.7.

O portfólio precisa de um ambiente reproduzível sem afirmar que MySQL e MariaDB
são produtos idênticos.

## Decisão

- usar PHP 8.5 e Laravel 13;
- usar Composer 2 e versionar `composer.lock`;
- usar MySQL 5.7 em desenvolvimento e no CI;
- usar o driver `mysql` do Laravel e `utf8mb4`;
- manter MariaDB gerenciado pela Hostinger em produção;
- restringir migrations e consultas ao comportamento compatível entre MySQL 5.7
  e MariaDB;
- usar Blade e Vite no mesmo monólito Laravel;
- executar filas com o driver `sync`, sem jobs assíncronos, cron ou workers.

## Consequências

- Docker e CI compartilham a mesma versão de banco;
- o banco local não reproduz todas as particularidades do MariaDB de produção;
- recursos exclusivos de MySQL 8, collations específicas e SQL dependente do
  fornecedor não poderão ser usados;
- migrations deverão ser verificadas no ambiente hospedado antes do lançamento;
- MySQL 5.7 não será exposto nem utilizado como banco de produção.
