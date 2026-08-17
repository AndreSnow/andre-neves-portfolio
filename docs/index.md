# Documentação

Este é o ponto de entrada da documentação do portfólio de André Neves. Os
documentos registram o produto que queremos construir, as decisões que orientam
sua arquitetura e o caminho planejado para entregá-lo.

## Por onde começar

1. Leia a [visão do produto](produto/visao.md) para entender propósito, públicos e
   princípios.
2. Consulte os [requisitos iniciais](produto/requisitos.md) para conhecer o escopo
   funcional, os requisitos de qualidade e os limites do MVP.
3. Veja a [visão geral da arquitetura](arquitetura/visao-geral.md) para entender a
   direção técnica e as restrições da hospedagem.
4. Acompanhe o [roadmap](gestao/roadmap.md) para saber a ordem planejada das
   entregas.

## Produto

- [Visão do produto](produto/visao.md): propósito, públicos, proposta de valor e
  princípios;
- [Requisitos iniciais](produto/requisitos.md): funcionalidades, requisitos não
  funcionais e critérios do MVP.

## Arquitetura

- [Visão geral](arquitetura/visao-geral.md): contexto, componentes, limites e
  decisões ainda pendentes;
- [Registros de decisão arquitetural](arquitetura/adr/README.md): índice e regras
  dos ADRs;
- [ADR-0000](arquitetura/adr/0000-governanca-da-documentacao.md): governança da
  documentação;
- [ADR-0001](arquitetura/adr/0001-monolito-laravel.md): monólito Laravel
  renderizado no servidor;
- [ADR-0002](arquitetura/adr/0002-conteudo-estruturado.md): conteúdo estruturado
  e administrável.

## Gestão

- [Roadmap inicial](gestao/roadmap.md): descoberta, fundação técnica, MVP,
  lançamento e evolução posterior.

## Estado atual

O projeto está na fase de descoberta e fundação. A aplicação Laravel ainda não
foi iniciada. Antes disso, serão validados os recursos da hospedagem e registradas
as decisões essenciais sobre painel, PDF, analytics, privacidade, segurança e
CI/CD.

## Convenções

- documentos descrevem o estado atual ou a direção aprovada do projeto;
- decisões arquiteturais relevantes são registradas em ADRs numerados;
- uma mudança de comportamento deve atualizar a documentação relacionada;
- informações sensíveis, credenciais e dados pessoais de visitantes nunca devem
  ser adicionados à documentação versionada.
