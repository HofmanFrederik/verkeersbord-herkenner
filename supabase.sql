-- Plak dit in Supabase: SQL Editor, en klik op Run.
create table if not exists public.scores (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 20),
  score integer not null check (score between 0 and 1000),
  created_at timestamptz not null default now()
);

alter table public.scores enable row level security;

-- Iedereen mag de scores lezen en een score toevoegen.
-- Niemand mag scores aanpassen of verwijderen.
create policy "scores lezen" on public.scores
  for select using (true);

create policy "scores toevoegen" on public.scores
  for insert with check (true);
