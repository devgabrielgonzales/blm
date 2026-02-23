-- Tabela de conteúdo editável do site (key-value)
CREATE TABLE IF NOT EXISTS site_content (
  key TEXT PRIMARY KEY,
  value TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS: leitura pública (site), escrita apenas para usuários autenticados (admin)
ALTER TABLE site_content ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Leitura pública" ON site_content;
CREATE POLICY "Leitura pública" ON site_content FOR SELECT USING (true);

DROP POLICY IF EXISTS "Escrita autenticados" ON site_content;
CREATE POLICY "Escrita autenticados" ON site_content FOR ALL
  USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

-- Seed com valores default (INSERT ... ON CONFLICT DO UPDATE para idempotência)
INSERT INTO site_content (key, value) VALUES
  -- Hero
  ('hero_logo', 'src/assets/img/logo-grande.png'),
  ('hero_subtitle', 'Assetto Corsa Competizione • Servidores Monitorados • Comunidade'),
  ('hero_title', 'A melhor experiência de simulação para quem quer evoluir no ACC'),
  ('hero_description', 'Ambiente sem estresse para treinar, evoluir e competir com respeito. Ranking por pista, temporada atual e acompanhamento real para pilotos que querem constância e performance.'),
  ('hero_cta_discord', 'Entrar no Discord'),
  ('hero_cta_ranking', 'Ver Ranking'),
  ('hero_feature1', 'Moderação ativa'),
  ('hero_feature2', 'Métricas por pista'),
  ('hero_feature3', 'Resultados reais'),
  ('hero_background_image', 'https://images.unsplash.com/photo-1517949908119-7205b2bcd1f0?q=80&w=2400&auto=format&fit=crop'),
  ('hero_video', 'src/assets/video/trailer.mp4'),
  -- Quick Title
  ('quick_label', 'Brasil Legends Motorsport'),
  ('quick_title', 'Ranking oficial • servidores • transmissões • performance'),
  -- Signpost 1
  ('signpost1_image', 'src/assets/img/banner 1.png'),
  ('signpost1_title', 'Ranking'),
  ('signpost1_subtitle', 'Por pista • temporada atual • categorias por %'),
  -- Signpost 2
  ('signpost2_image', 'src/assets/img/banner 2.png'),
  ('signpost2_title', 'Comunidade'),
  ('signpost2_subtitle', 'Ambiente monitorado • respeito • evolução'),
  -- Signpost 3
  ('signpost3_image', 'src/assets/img/banner 3.png'),
  ('signpost3_title', 'Transmissões'),
  ('signpost3_subtitle', 'Narração ACC • campeonatos • highlights'),
  -- Signpost 4
  ('signpost4_image', 'src/assets/img/banner 4.png'),
  ('signpost4_title', 'BLM Performance'),
  ('signpost4_subtitle', 'Acompanhamento individual • metas • métricas'),
  -- Ranking
  ('ranking_title', 'RANKING OFICIAL'),
  ('ranking_subtitle', 'Ranking por pista, considerando apenas a temporada atual e apenas sessões de corrida.'),
  ('ranking_pista_semana', 'Pista da semana: Barcelona'),
  ('ranking_pista_key', 'barcelona'),
  -- Community
  ('community_title', 'COMUNIDADE BLM'),
  ('community_description', 'Servidores monitorados para garantir um ambiente de treinamento agradável e sem estresse — ideal para quem está começando e também para quem quer voltar a competir com consistência.'),
  ('community_card1_title', 'Foco no respeito'),
  ('community_card1_text', 'Regras claras e moderação ativa.'),
  ('community_card2_title', 'Evolução real'),
  ('community_card2_text', 'Treino com métricas, metas e método.'),
  ('community_card3_title', 'Servidores BLM'),
  ('community_card3_text', 'Corridas organizadas e estáveis.'),
  ('community_card4_title', 'Para iniciantes'),
  ('community_card4_text', 'Ambiente seguro pra aprender sem medo.'),
  ('community_cta_discord', 'Entrar no Discord'),
  ('community_cta_performance', 'BLM Performance'),
  ('community_image', 'src/assets/img/banner comunidade.jpg'),
  ('community_objective_title', 'Objetivo BLM'),
  ('community_objective_text', 'Incluir novos jogadores e atrair pilotos experientes de volta para uma experiência única.'),
  -- Broadcast
  ('broadcast_title', 'TRANSMISSÕES'),
  ('broadcast_description', 'Narração de corridas no Assetto Corsa Competizione, campeonatos e conteúdo pra comunidade evoluir.'),
  ('broadcast_cta', 'Abrir canal no YouTube'),
  ('broadcast_video_id', 'LL2NUmtoEzA'),
  ('broadcast_video_title', 'Highlights | Brasil Challenge Amador | 7º Etapa - Mount Panorama | 18-10-25'),
  -- Performance
  ('performance_title', 'BLM PERFORMANCE'),
  ('performance_subtitle', 'Acompanhamento individual e privado para pilotos amadores do ACC. Não é curso, não é PDF, não é vídeo gravado — é acompanhamento real, feito sob medida.'),
  ('performance_card1_title', 'O que trabalhamos'),
  ('performance_card1_items', 'Configuração física (PC, cockpit, volante e pedais)|Ajustes do ACC e do PC para melhor performance|Análise individual da pilotagem|Plano de evolução com metas claras|Acompanhamento semanal com métricas dos servidores BLM'),
  ('performance_card2_title', 'Como funciona'),
  ('performance_card2_items', '8 horas semanais (horário flexível)|Aulas particulares e privadas|Horas não acumulativas|Tolerância de 15 min de atraso|Cancelamento com 12h de antecedência'),
  ('performance_card2_footer', 'Investimento: você pode colocar aqui depois (ou deixar para fechar no Discord).'),
  ('performance_card3_title', 'Suporte exclusivo'),
  ('performance_card3_items', 'Sala reservada no Discord (horário comercial)|Cargo Performance|Atendimento prioritário pela administração BLM'),
  ('performance_cta', 'Entrar para solicitar'),
  -- Support
  ('support_title', 'APOIE A BLM'),
  ('support_description', 'A BLM tem custo com server dedicado, administração das competições, transmissão das corridas e cuidados para que tudo funcione com o mínimo de paz para as atividades.'),
  ('support_pix_key', 'familytechrio@gmail.com'),
  ('support_pix_name', 'Luciano da Silva Neves'),
  ('support_paypal', 'familytechrio@gmail.com'),
  ('support_qrcode_image', 'src/assets/img/pix.png'),
  ('support_transparency_title', 'Transparência'),
  ('support_transparency_text', 'O apoio ajuda a manter e melhorar tudo que existe hoje na BLM: servidores, organização, transmissão e evolução da comunidade.'),
  -- Footer
  ('footer_copyright', '© {year} BLM Brasil — Brasil Legends Motorsport. Todos os direitos reservados.')
ON CONFLICT (key) DO NOTHING;
