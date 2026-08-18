# Requisitos iniciais

## Funcionais

### Site público

- homepage com proposta de valor, experiência, competências e chamadas para ação;
- projetos apresentados como estudos de caso;
- currículo em HTML e PDF compatível com ATS;
- links para GitHub, LinkedIn e outros canais configurados;
- botão flutuante de WhatsApp configurável, acessível e desativável, usando
  contato profissional cadastrado exclusivamente no ambiente de produção;
- caderno de notas técnicas selecionadas a partir do Obsidian;
- suporte arquitetural a português e inglês;
- páginas legais e canal para solicitações de privacidade.

### Administração

- autenticação sem cadastro público e com segundo fator;
- gestão de perfil, experiências, formação, competências e projetos;
- gestão de links, CTAs, WhatsApp e disponibilidade profissional;
- editor e importação manual de notas Markdown;
- rascunho, pré-visualização, publicação, ordenação e versionamento;
- gestão de metadados de SEO e compartilhamento;
- visualização de métricas, auditoria e erros sanitizados;
- regeneração manual e limitada do PDF e invalidação de cache.

### Analytics

- registrar visualizações, downloads e cliques relevantes;
- medir acessos a projetos, LinkedIn, GitHub, contato e WhatsApp;
- registrar somente origem normalizada, UTM permitida e profundidade de rolagem
  de forma minimalista;
- limitar o crescimento dos eventos e permitir limpeza administrativa manual;
- não armazenar IP, user agent completo, fingerprint persistente, URL de origem
  completa ou conteúdo digitado pelo visitante.

## Não funcionais

- compatibilidade com hospedagem compartilhada da Hostinger;
- Laravel, Blade e MySQL sem processos residentes obrigatórios;
- nenhuma dependência de cron, filas ou processamento assíncrono;
- JavaScript mínimo e assets compilados antes do deploy;
- HTML semântico, navegação por teclado e contraste adequado;
- SEO técnico, sitemap, canonical, Open Graph e dados estruturados;
- HTTPS, proteção CSRF, rate limiting e uploads controlados;
- backup, restauração e retenção documentados;
- páginas públicas cacheáveis e responsivas.

## Critérios do MVP

- homepage publicada em português;
- painel capaz de alterar o conteúdo principal sem deploy;
- ao menos três estudos de caso ou projetos representativos;
- currículo HTML e PDF funcional;
- notas Markdown publicáveis com revisão explícita;
- SEO, acessibilidade, segurança e privacidade básicos validados;
- dashboard com visitas, downloads e cliques em CTAs;
- CI executando o quality gate do projeto.
