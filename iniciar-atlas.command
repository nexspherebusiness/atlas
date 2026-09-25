#!/bin/sh
set -eu
atlas_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$atlas_dir/projeto"
if [ ! -f .env.local ] || [ ! -f .dev.vars ]; then ./atlas configurar; fi
if [ ! -f dist/server/wrangler.json ]; then ./atlas build; fi
./atlas restaurar
echo 'ATLAS local disponível em http://127.0.0.1:5173/ . Para encerrar, pressione Ctrl+C.'
exec ./atlas iniciar
