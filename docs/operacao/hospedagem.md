# Hospedagem de produção

## Contexto

A primeira versão do portfólio será publicada no plano **Business** da Hostinger.
Este documento registra as capacidades conhecidas da hospedagem compartilhada,
as restrições que orientam a arquitetura e os dados que ainda precisam ser
confirmados diretamente no hPanel.

Os limites comerciais podem mudar. Antes de cada decisão de infraestrutura,
devem prevalecer os valores exibidos para a assinatura ativa no hPanel.

## Capacidades documentadas

Segundo a documentação oficial consultada em 17 de agosto de 2026, o plano
Business oferece:

| Recurso | Limite publicado |
|---|---:|
| CPU | 2 núcleos |
| Memória da hospedagem | 1.536 MB |
| Armazenamento | 50 GB |
| Inodes | 600.000 |
| Bancos de dados | 300 |
| Tamanho por banco | 3 GB |
| Conexões MySQL por usuário | 75 |
| Memória PHP | 2.048 MB |
| Tempo máximo de execução PHP | 360 segundos |
| Banda | Ilimitada |

Também há suporte documentado a:

- acesso SSH em planos Premium ou superiores;
- Composer 2 pelo terminal SSH;
- escolha de versão, extensões e opções do PHP;
- aplicações PHP personalizadas e bancos MySQL.

Embora a hospedagem ofereça tarefas agendadas, o projeto decidiu não utilizar
cron nem processamento assíncrono.

## Consequências para a aplicação

- o Laravel deverá funcionar sem processos residentes;
- não haverá filas, workers, cron ou tarefas executadas em segundo plano;
- toda operação deverá terminar dentro da requisição que a iniciou;
- assets serão compilados no CI, sem exigir Node.js em produção;
- páginas públicas e consultas frequentes deverão utilizar cache;
- o PDF público será um arquivo pronto, nunca gerado durante o download;
- manutenções que não puderem ocorrer durante uma requisição administrativa
  serão executadas explicitamente durante o deploy ou por comando manual;
- eventos, logs, PDFs e uploads terão limites rígidos de quantidade, tamanho e
  retenção;
- envio de e-mail transacional deverá preferir SMTP autenticado a `mail()`.

## Validações pendentes no hPanel

Antes de iniciar a implementação ou definir versões, confirmar:

- [x] PHP 8.5 selecionado para o domínio;
- [ ] versão efetiva do MySQL;
- [ ] extensões PHP necessárias ao Laravel e à biblioteca de PDF;
- [ ] versão efetiva do Composer 2 no servidor;
- [ ] acesso SSH habilitado e autenticação por chave;
- [ ] possibilidade de apontar o document root diretamente para `public`;
- [ ] frequência, retenção e restauração dos backups da Hostinger;
- [ ] domínio e subdomínio eventualmente usados para homologação;
- [ ] caminho absoluto da aplicação e estrutura de `public_html`;
- [ ] modo de deploy permitido por SSH/SFTP e acesso do GitHub Actions;
- [ ] mecanismo de instalação, renovação e forçamento de HTTPS;
- [ ] fornecedor SMTP e limites da conta de e-mail utilizada.

## Informações que não devem ser versionadas

- usuário, senha, host ou porta SSH;
- credenciais do MySQL;
- caminhos que revelem identificadores sensíveis da conta;
- chaves privadas, tokens de deploy ou segredos da aplicação;
- conteúdo do arquivo `.env` de produção.

Esses valores deverão existir apenas no ambiente apropriado e, quando
necessários ao deploy, nos secrets protegidos do GitHub.

## Referências oficiais

- [Parâmetros e limites dos planos de hospedagem](https://support.hostinger.com/pt/articles/6976044-parametros-e-limites-dos-planos-de-hospedagem)
- [Como se conectar via SSH](https://support.hostinger.com/pt/articles/1583245-como-se-conectar-a-sua-conta-via-ssh)
- [Como usar o Composer](https://support.hostinger.com/pt/articles/5792078-como-usar-o-composer)
- [Como gerenciar extensões e opções do PHP](https://support.hostinger.com/pt/articles/4667515-como-gerenciar-extensoes-e-opcoes-do-php-no-hpanel)
