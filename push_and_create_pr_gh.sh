#!/bin/bash
set -euo pipefail

# =======================
# Configurações
# =======================
REPO_DIR="/opt/infra-network-automation"   # pasta do repositório
REPO_URL="https://github.com/isusnetdev/infra-network-automation.git"
BASE_BRANCH="production"
FEATURE_BRANCH="feature/multi-vendor-skeleton"
PR_TITLE="Adiciona esqueleto multi-vendor"
PR_BODY="Estrutura inicial para automação multi-vendor com Ansible e Semaphore."
GIT_USER_NAME="isusnetdev"                   # altere para seu nome
GIT_USER_EMAIL="isusnetdev@gmail.com"    # altere para seu email

# =======================
# Inicialização do repositório
# =======================
mkdir -p "$REPO_DIR"
cd "$REPO_DIR"

if [ ! -d ".git" ]; then
    echo "🚀 Inicializando repositório Git..."
    git init
    echo "# Infra Network Automation" > README.md
    git add README.md
    git commit -m "Initial commit"
    git branch -M "$BASE_BRANCH"
    git remote add origin "$REPO_URL"
    git push -u origin "$BASE_BRANCH"
fi

# =======================
# Configura usuário Git
# =======================
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# =======================
# Garantir que a branch production exista
# =======================
git fetch origin || true

if git show-ref --verify --quiet "refs/remotes/origin/$BASE_BRANCH"; then
    echo "✅ Branch $BASE_BRANCH já existe no remoto"
else
    echo "📌 Branch $BASE_BRANCH não encontrada, criando..."
    git checkout -b "$BASE_BRANCH"
    git push -u origin "$BASE_BRANCH"
fi

# =======================
# Criar branch de feature
# =======================
if git show-ref --verify --quiet "refs/heads/$FEATURE_BRANCH"; then
    git checkout "$FEATURE_BRANCH"
else
    git checkout -b "$FEATURE_BRANCH"
fi

# =======================
# Adicionar arquivos do esqueleto
# =======================
if [ -d "./network-automation-multivendor" ]; then
    echo "📦 Copiando conteúdo do esqueleto..."
    cp -r ./network-automation-multivendor/* .
    rm -rf ./network-automation-multivendor
fi

git add .
git commit -m "$PR_TITLE" || echo "⚠️ Nenhuma mudança para commitar"

# =======================
# Push para remoto
# =======================
git push -u origin "$FEATURE_BRANCH"

# =======================
# Criar Pull Request sem abrir navegador
# =======================
gh pr create --base "$BASE_BRANCH" --head "$FEATURE_BRANCH" \
    --title "$PR_TITLE" --body "$PR_BODY" --fill

echo "✅ Pull Request criado com sucesso!"
