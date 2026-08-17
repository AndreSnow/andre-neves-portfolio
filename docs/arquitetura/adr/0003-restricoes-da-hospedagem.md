# ADR-0003: arquitetura compatível com hospedagem compartilhada

## Status

Aceita

## Contexto

A aplicação será inicialmente executada no plano Business da Hostinger. Embora
o plano ofereça PHP, MySQL, SSH e Composer, uma hospedagem compartilhada não
deve ser tratada como um servidor com processos residentes e recursos dedicados.

O portfólio precisa manter boa velocidade, administração de conteúdo, geração
de PDF e analytics sem exigir infraestrutura incompatível com esse ambiente.

## Decisão

- não existirão cron, filas, workers, daemons ou processamento assíncrono;
- tarefas da aplicação serão síncronas e limitadas por tempo, memória e volume;
- operações administrativas mais caras produzirão artefatos reutilizáveis;
- o currículo PDF não será regenerado em todo download;
- páginas públicas, configurações e consultas de leitura intensa usarão cache;
- eventos, logs, arquivos e backups terão retenção compatível com os limites da
  hospedagem;
- build frontend, análise estática e testes serão executados fora da produção;
- versões de PHP, Laravel e bibliotecas somente serão fixadas depois da validação
  dos recursos efetivos da assinatura.

## Consequências

- a aplicação continuará operável sem Redis, Supervisor, cron ou Node.js no
  servidor;
- recursos que exijam execução recorrente, demorada ou contínua ficarão fora do
  escopo até uma nova decisão arquitetural;
- cache e agregação serão essenciais para limitar consultas e crescimento do
  MySQL;
- uma futura migração para VPS ou cloud não deverá ser necessária para o MVP.
