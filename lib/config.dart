// Fill these two in from your Supabase project:
//   Project Settings -> API -> Project URL  and  anon / public key.
// The anon key is designed to be public; your data is protected by the
// row-level-security rules in supabase/schema.sql.
//
// Leave them as-is to run the app offline (local-only, like v1.1).

const String kSupabaseUrl = 'https://cgkzmszsqpgbwjdbskzz.supabase.co';
const String kSupabaseAnonKey = 'sb_publishable_-0QLzWqs-i0QSKb-U2vNig_ghIEu9F5';

bool get kSupabaseConfigured =>
    kSupabaseUrl.startsWith('https://') && kSupabaseAnonKey.length > 20;
