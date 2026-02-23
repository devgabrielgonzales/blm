/**
 * Configuração do Supabase
 * URL: https://bsnnvsdzwqdthrrubbko.supabase.co
 * Para produção: use variáveis de ambiente ou substitua SUPABASE_ANON_KEY
 */
(function () {
  const SUPABASE_URL = 'https://bsnnvsdzwqdthrrubbko.supabase.co';
  const SUPABASE_ANON_KEY = window.SUPABASE_ANON_KEY || '';

  window.supabaseConfig = {
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
    isConfigured: () => !!SUPABASE_ANON_KEY,
  };
})();
