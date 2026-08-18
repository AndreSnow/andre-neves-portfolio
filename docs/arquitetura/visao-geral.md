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

- não haverá filas, workers, cron ou processos residentes;
- operações serão síncronas, limitadas e iniciadas por uma requisição
  explícita ou pelo processo de deploy;
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

- biblioteca e estratégia de geração do PDF;
- painel administrativo adotado;
- disponibilidade de SSH e estrutura de diretórios da Hostinger;
- fluxo de homologação e mecanismo final de deploy;
- modelo detalhado de traduções e conteúdo.

PHP 8.5, Laravel 13, Composer 2 e MySQL 5.7 para desenvolvimento e CI foram
definidos no [ADR-0004](adr/0004-stack-inicial.md).

Os recursos publicados do plano e o checklist de verificação da assinatura estão
registrados em [Hospedagem de produção](../operacao/hospedagem.md).
