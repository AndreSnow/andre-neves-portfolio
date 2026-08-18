# André Neves — Portfólio

Homepage profissional, currículo e caderno técnico de André Neves.

O projeto apresentará trabalhos e experiências como estudos de caso, oferecerá
currículo HTML/PDF e permitirá publicar conteúdo sem novos deploys. A aplicação
será otimizada para hospedagem compartilhada, privacidade, acessibilidade, SEO e
baixo uso de JavaScript.

## Estado

Fundação técnica inicial em desenvolvimento.

## Direção técnica

- monólito Laravel com Blade;
- MySQL para conteúdo, auditoria e métricas;
- painel administrativo;
- assets compilados antes do deploy;
- analytics próprio e minimalista;
- publicação inicial em português, preparada para outros idiomas;
- CI/CD adequado aos recursos disponíveis na Hostinger.

## Desenvolvimento local

Requisitos: Docker e Docker Compose.

```bash
cp .env.example .env
docker compose build app
docker compose run --rm --no-deps app composer install
docker compose run --rm --no-deps app php artisan key:generate
docker compose up -d db
docker compose run --rm app php artisan migrate
docker compose up app assets
```

O ambiente local usa credenciais exclusivamente fictícias e um MySQL 5.7 não
exposto em produção. A aplicação, o Vite e o MySQL usam no host as portas
`8088`, `5188` e `3308`, respectivamente, para evitar conflitos com outros
projetos locais.

## Documentação

- [Índice da documentação](docs/index.md)
- [Visão do produto](docs/produto/visao.md)
- [Requisitos iniciais](docs/produto/requisitos.md)
- [Visão da arquitetura](docs/arquitetura/visao-geral.md)
- [ADRs](docs/arquitetura/adr/README.md)
- [Roadmap](docs/gestao/roadmap.md)
- [Padrões de commit](docs/gestao/padroes-de-commit.md)

## Licença

Nenhuma licença de reutilização foi concedida por enquanto.
