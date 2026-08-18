# Segurança e privacidade

## Premissa de repositório público

Todo arquivo versionado deve ser considerado imediatamente acessível a qualquer
pessoa e preservado no histórico do Git, mesmo depois de removido. Segurança não
dependerá de esconder o funcionamento da aplicação, mas nenhum dado operacional,
segredo ou informação privada será incluído no repositório.

## Dados proibidos no Git

- arquivos `.env` reais;
- chaves, tokens, senhas e credenciais;
- endereços de servidor, usuários ou caminhos associados à conta;
- backups, bancos, exports, logs ou dumps de erros reais;
- e-mail, telefone, endereço ou documento pessoal não aprovado para publicação;
- IP, identificador, mensagem ou qualquer dado real de visitantes;
- dados de clientes, empregadores ou projetos sob confidencialidade;
- screenshots do painel que revelem informações operacionais.

Exemplos e fixtures usarão valores manifestamente fictícios. Um scanner de
segredos deverá fazer parte do CI e do fluxo local antes do push.

## Dados profissionais públicos

Somente informações escolhidas explicitamente para publicação poderão aparecer
no site. Conteúdo administrável ficará no banco de produção, não em seeds ou
fixtures do repositório.

Um número usado no botão de WhatsApp se torna publicamente descobrível no HTML,
mesmo quando armazenado no banco. Portanto, deverá ser um contato profissional
aceito para exposição pública e separado do número pessoal. Seu valor será
cadastrado somente no painel de produção e nunca aparecerá em documentação,
seeds, fixtures ou testes versionados.

## Privacidade dos visitantes

- não armazenar IP nem hash de IP;
- não armazenar user agent completo;
- não aplicar fingerprint do dispositivo;
- não registrar texto digitado ou movimento do cursor;
- não guardar URL de origem completa, que pode conter dados em query strings;
- aceitar somente nomes de campanha UTM conhecidos, com tamanho e caracteres
  limitados;
- usar categorias amplas de dispositivo quando realmente necessário;
- limitar eventos repetidos e oferecer exclusão manual no painel;
- não incluir analytics ou heatmap de terceiros no MVP.

Antes da implementação, cada campo analítico deverá constar em um inventário de
dados com finalidade, acesso, retenção e forma de exclusão.

## Controles mínimos

- HTTPS e cabeçalhos de segurança;
- painel sem cadastro público, com 2FA e rate limiting;
- autorização explícita nas ações administrativas;
- cookies seguros e proteção CSRF;
- validação e sanitização de Markdown, HTML e uploads;
- erros públicos genéricos e logs administrativos sanitizados;
- backups fora do diretório público;
- dependências bloqueadas por lockfiles e verificadas pelo CI;
- revisão manual de toda nota importada do Obsidian.

## Resposta a incidente de segredo

Se um segredo for versionado, removê-lo em outro commit não será suficiente. O
segredo deverá ser revogado ou rotacionado imediatamente, seu uso investigado e
o histórico tratado conforme procedimento específico. A rotação vem antes de
qualquer tentativa de reescrever o histórico.
