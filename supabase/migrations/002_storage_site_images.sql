-- Bucket para imagens do site (upload pelo painel admin)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'site-images',
  'site-images',
  true,
  5242880,
  ARRAY['image/jpeg', 'image/png', 'image/gif', 'image/webp', 'image/svg+xml']
)
ON CONFLICT (id) DO UPDATE SET
  public = true,
  file_size_limit = 5242880,
  allowed_mime_types = ARRAY['image/jpeg', 'image/png', 'image/gif', 'image/webp', 'image/svg+xml'];

-- Políticas: leitura pública, escrita apenas autenticados
DROP POLICY IF EXISTS "Leitura pública site-images" ON storage.objects;
CREATE POLICY "Leitura pública site-images" ON storage.objects FOR SELECT
  TO public USING (bucket_id = 'site-images');

DROP POLICY IF EXISTS "Upload autenticados site-images" ON storage.objects;
CREATE POLICY "Upload autenticados site-images" ON storage.objects FOR INSERT
  TO authenticated WITH CHECK (bucket_id = 'site-images');

DROP POLICY IF EXISTS "Update autenticados site-images" ON storage.objects;
CREATE POLICY "Update autenticados site-images" ON storage.objects FOR UPDATE
  TO authenticated USING (bucket_id = 'site-images');
