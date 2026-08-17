# Visão geral da arquitetura

## Contexto

O produto precisa combinar páginas públicas predominantemente estáticas com
conteúdo administrável, geração de currículo e analytics próprio. A produção
deve operar nos limites de uma hospedagem compartilhada.

## Direção inicial

```text
Visitante
   ↓
Laravel + Blade → páginas HTML cacheadas
   ↓
MySQL → conteúdo, métricas, auditoria e versões
   ↓
Painel administrativo
```

- Laravel será a aplicação única;
- Blade renderizará a interface pública no servidor;
- Alpine.js poderá atender interações pontuais;
- MySQL armazenará conteúdo estruturado e dados operacionais;
- o painel administrativo editará conteúdo sem alterar a estrutura visual;
- homepage, currículo HTML e PDF compartilharão a mesma fonte de dados;
- GitHub Actions executará testes e compilará os assets antes do deploy.

## Limites

- nenhuma fila ou processo residente será requisito para funcionamento;
- tarefas recorrentes deverão funcionar via cron ou execução sob demanda;
- o deploy não dependerá de Node.js na hospedagem;
- integrações externas deverão degradar de forma segura;
- logs, uploads e eventos terão limites de retenção.

## Separação de informações

| Tipo | Público | Administração | Persistência inicial |
|---|---:|---:|---|
| Conteúdo e atualizações publicadas | Sim | Sim | MySQL |
| Métricas agregadas selecionadas | Opcional | Sim | MySQL |
| Auditoria administrativa | Não | Sim | MySQL |
| Erros e detalhes técnicos | Não | Restrita | Arquivo e/ou MySQL |

## Decisões pendentes

- versões mínimas de PHP e Laravel suportadas pela hospedagem;
- biblioteca e estratégia de geração do PDF;
- painel administrativo adotado;
- disponibilidade de SSH, cron e estrutura de diretórios da Hostinger;
- fluxo de homologação e mecanismo final de deploy;
- modelo detalhado de traduções e conteúdo.
