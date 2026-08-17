# Geração de PDF e performance

## Objetivo

Oferecer um currículo PDF consistente sem transformar cada download em uma
operação cara. O visitante deve receber um arquivo pronto e a hospedagem não deve
processar múltiplas gerações concorrentes.

## Fluxo proposto

```text
Administrador altera o currículo
  → solicita uma prévia
  → aplicação valida os limites
  → gera PDF de forma síncrona
  → administrador revisa
  → publicação substitui o arquivo atual atomicamente
  → visitante baixa o arquivo pronto
```

Uma falha de geração não removerá nem substituirá a última versão válida.

## Limites iniciais a validar

- geração permitida apenas a administradores autenticados e autorizados;
- uma geração em andamento por idioma e variante de currículo;
- intervalo mínimo entre tentativas para impedir abuso acidental;
- quantidade máxima de páginas, imagens e tamanho do documento;
- tempo máximo menor que o limite PHP da hospedagem;
- imagens previamente redimensionadas e otimizadas;
- quantidade limitada de versões anteriores armazenadas;
- download público sem consulta pesada e sem geração dinâmica.

Os valores numéricos serão definidos depois de um protótipo medido com a
biblioteca escolhida. Limites não serão copiados diretamente dos máximos da
hospedagem.

## Cache e páginas públicas

- configurações e conteúdo publicado poderão ser mantidos em cache de arquivo;
- publicações feitas no painel invalidarão somente as chaves afetadas;
- consultas deverão evitar N+1 e selecionar apenas colunas necessárias;
- imagens usarão dimensões explícitas, formatos modernos e carregamento tardio;
- JavaScript público terá orçamento reduzido e nenhuma integração externa
  pesada;
- o botão de WhatsApp será um link comum, sem SDK ou widget de terceiros;
- metas de Core Web Vitals e tamanho de assets serão validadas no CI quando a
  interface existir.

## Proteção contra abuso

- downloads poderão ter rate limiting com resposta que preserve a experiência
  de visitantes legítimos;
- cliques e downloads repetidos na mesma navegação não precisam gerar eventos
  ilimitados;
- o endpoint de geração nunca será público;
- nomes internos, caminhos do servidor e mensagens da biblioteca não aparecerão
  em respostas públicas.
