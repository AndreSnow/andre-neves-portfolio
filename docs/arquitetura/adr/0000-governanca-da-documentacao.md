# ADR-0000: governança da documentação

## Status

Aceita

## Contexto

O projeto envolve produto, conteúdo, privacidade, operação e arquitetura. Sem
documentação versionada, decisões podem perder contexto ou divergir da
implementação.

## Decisão

- manter documentação no diretório `docs` do mesmo repositório;
- registrar decisões arquiteturais relevantes como ADRs numerados;
- atualizar requisitos e documentos afetados na mesma mudança de código;
- tratar código e comportamento executável como fonte final de verdade;
- manter documentos curtos, conectados e voltados a decisões atuais.

## Consequências

- mudanças relevantes exigirão revisão documental;
- o histórico das decisões permanecerá auditável no Git;
- documentos desatualizados serão tratados como defeitos do projeto.
