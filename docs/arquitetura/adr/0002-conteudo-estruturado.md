# ADR-0002: conteúdo estruturado e administrável

## Status

Aceita

## Contexto

Perfil, experiências, projetos, currículo e notas mudarão com maior frequência
que a estrutura visual. Exigir deploy para essas alterações tornaria a manutenção
desnecessariamente lenta.

## Decisão

- armazenar no MySQL o conteúdo sujeito a edição;
- manter estrutura, componentes e identidade visual no código;
- representar experiências, projetos, competências, traduções e notas como dados
  estruturados, evitando um único bloco HTML;
- utilizar a mesma fonte de dados para homepage, currículo HTML e PDF;
- oferecer rascunho, pré-visualização, publicação, ordenação e versões;
- importar manualmente apenas notas do Obsidian explicitamente aprovadas.

## Consequências

- mudanças editoriais não exigirão deploy;
- o modelo de dados precisará preservar relações e traduções;
- publicações deverão invalidar caches e, quando aplicável, regenerar o PDF;
- conteúdo Markdown ou rico deverá ser sanitizado antes da renderização.
