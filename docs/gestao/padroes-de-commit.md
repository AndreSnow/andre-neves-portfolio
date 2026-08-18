# Padrões de commit

## Formato

Commits devem seguir o formato:

```text
tipo(escopo): mensagem #000
```

O CI valida esse formato em todas as pull requests.

Exemplo com uma issue real:

```text
feat(curriculo): adiciona download da versão em PDF #42
```

Exemplo de fundação sem issue:

```text
chore(scaffold): inicia aplicacao Laravel #000
```

## Referência

- usar o número real quando a mudança estiver ligada a uma issue;
- reservar `#000` para fundação, manutenção ou tarefas sem issue;
- não inventar um número nem referenciar uma issue sem relação com a mudança;
- relacionar a issue no corpo da pull request quando ela precisar ser encerrada.

## Tipos permitidos

| Tipo | Uso |
|---|---|
| `feat` | nova capacidade percebida pelo usuário ou administrador |
| `fix` | correção de defeito |
| `docs` | alteração exclusiva de documentação |
| `refactor` | mudança interna sem alterar comportamento esperado |
| `perf` | melhoria mensurável de desempenho |
| `test` | criação ou correção de testes |
| `build` | dependências, imagens e processo de build |
| `ci` | automação de integração ou entrega contínua |
| `chore` | manutenção que não cabe nos tipos anteriores |
| `security` | endurecimento ou correção de segurança |

## Escopo

O escopo é obrigatório, deve estar em português quando natural e representar a
área afetada. Exemplos:

```text
home
curriculo
projetos
notas
admin
analytics
seo
privacidade
docker
deploy
ci
docs
```

## Mensagem

- escrever em português;
- iniciar com verbo no presente do indicativo;
- usar letras minúsculas, exceto nomes próprios;
- ser objetiva e descrever uma única mudança coerente;
- não terminar com ponto;
- não incluir credenciais, contatos privados, dados de visitantes ou detalhes
  sensíveis da infraestrutura.

Exemplos aceitos:

```text
feat(projetos): permite ordenar estudos de caso #18
fix(analytics): limita eventos repetidos de download #27
perf(home): reduz consultas do conteudo publicado #31
docs(seguranca): registra politica de retencao #000
```

Exemplos rejeitados:

```text
ajustes
feat: nova tela
feat(admin): Alterações diversas. #12
fix(banco): usa senha real do servidor #000
```

## Mudanças incompatíveis

Quando houver uma quebra deliberada de compatibilidade, adicionar `!` depois do
escopo e explicar a migração no corpo do commit e da pull request:

```text
feat(curriculo)!: altera estrutura das versoes publicadas #52
```
