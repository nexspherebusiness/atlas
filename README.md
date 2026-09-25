# ATLAS — pasta oficial de manutenção

A única pasta de código ativa é `projeto/`. Abra essa pasta no Claude Code, Codex ou VS Code. Comece por `projeto/CLAUDE.md` e `documentacao/CONTINUIDADE.md`.

- `projeto/`: código atual, Git, logo, bibliotecas locais, testes e migrações.
- `backups/`: exportação completa de 17/09/2026 em JSON, SQLite e SQL; backups anteriores preservados.
- `documentacao/`: arquitetura, regras financeiras, operação e situação da hospedagem.
- `verificacao/`: manifestos, inventário e resultados da migração.
- `arquivo-historico/`: versões anteriores compactadas, sem outra pasta de sistema ativa.
- `outputs/`: arquivos que já estavam no Drive e pertencem a outras atividades; preservados.

Site em produção (desde 17/09/2026): https://atlas-saint-armont.saintarmont7.workers.dev/ — Cloudflare Workers + D1, conta própria da empresa (`saintarmont7@gmail.com`). Domínio próprio ainda não configurado.

Endereço antigo (ChatGPT Sites, `appgprj_6aa771db62708191b416309731388733`): https://saint-armont-financeiro.lucasmourahere.chatgpt.site/ — despublicado/tornado privado em 17/09/2026, após os dados serem conferidos como idênticos entre os dois lados. Não excluído (reversível), apenas fora do ar publicamente.

**O Drive armazena o projeto, mas não hospeda o site.** O backend e o banco de produção agora rodam na Cloudflare (Workers + D1), sob a conta da própria empresa, não mais sob um perfil de chat. Novos lançamentos online devem ser feitos apenas no endereço de produção acima.

A edição dos arquivos independe de qualquer perfil de chat. Publicar na Cloudflare exige `wrangler login` na conta `saintarmont7@gmail.com` (feito via terminal, sem senha exposta neste chat). Os segredos de produção (`APP_PASSWORD_HASH`, `SESSION_SECRET`) são gerados com `scripts/gerar-segredos-producao.py` — que nunca imprime a senha em texto puro — e configurados como *secrets* do Worker via `wrangler secret put`. A senha online foi trocada em 17/09/2026 durante a migração (o provedor anterior não permitia exportar/reaproveitar o hash antigo); a senha local é independente e configurada no primeiro uso.

**Atenção de plataforma:** o PBKDF2 do Cloudflare Workers aceita no máximo 100.000 iterações — `gerar-segredos-producao.py` e `configurar-local.py` já usam esse limite. Nunca gerar um novo hash com mais que isso.

A correção que exclui pedidos de cortesia do fornecedor (ex.: 9.16-1) está **concluída e publicada**, por decisão expressa do usuário em 18/09/2026 (o adiamento de 17/09/2026 foi cancelado).

Para abrir localmente neste Mac: execute `iniciar-atlas.command`. A senha local é configurada no primeiro uso, independente da senha online. O backup local não recebe automaticamente novos lançamentos do site online.
