-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run.

create table if not exists public.accounts (
  user_id        uuid primary key references auth.users(id) on delete cascade,
  bank           text             not null default 'ABD Bank',
  holder         text             not null,
  account        text             not null,
  cur            text             not null default 'LKR',
  balance        numeric(20,2)    not null default 0,
  hide           boolean          not null default false,
  last_int       bigint           not null default 0,
  carry          double precision not null default 0,
  total_interest numeric(20,2)    not null default 0,
  txns           jsonb            not null default '[]'::jsonb,
  updated_at     timestamptz      not null default now()
);

alter table public.accounts enable row level security;

-- Each signed-in user can only see and change their own row.
create policy "accounts_select_own" on public.accounts
  for select to authenticated using ((select auth.uid()) = user_id);

create policy "accounts_insert_own" on public.accounts
  for insert to authenticated with check ((select auth.uid()) = user_id);

create policy "accounts_update_own" on public.accounts
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "accounts_delete_own" on public.accounts
  for delete to authenticated using ((select auth.uid()) = user_id);
