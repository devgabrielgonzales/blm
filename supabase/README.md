# Setup Supabase para BLM

## 1. Criar tabela e políticas

No **Supabase Dashboard** do projeto: https://supabase.com/dashboard/project/bsnnvsdzwqdthrrubbko

1. Vá em **SQL Editor** → New query
2. Cole o conteúdo de `migrations/001_init_site_content.sql`
3. Execute (Run)

## 2. Obter a Anon Key

1. Vá em **Project Settings** → **API**
2. Copie a **anon public** key

## 3. Configurar o projeto

Edite `src/js/config.js` e cole a anon key:

```js
window.SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

## 4. Criar usuário Admin

Para editar o conteúdo, é necessário um usuário autenticado:

1. Vá em **Authentication** → **Users** → **Add user**
2. Crie um usuário com email e senha
3. Use esse email/senha para fazer login no `admin.html`

## 5. Storage (upload de imagens)

Para enviar imagens pelo painel em vez de colar URLs:

1. Vá em **SQL Editor** → New query
2. Cole o conteúdo de `migrations/002_storage_site_images.sql`
3. Execute (Run)

Ou manualmente: **Storage** → **New bucket** → Nome: `site-images` → Marque **Public bucket**.
