-- Chirptopia review system
-- Run this in Supabase SQL Editor after creating your project.

create table if not exists public.reviews (
  id uuid primary key default gen_random_uuid(),
  display_name text not null check (char_length(display_name) between 1 and 80),
  order_number text,
  rating integer not null check (rating between 1 and 5),
  review_text text not null check (char_length(review_text) between 3 and 800),
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  verified_purchase boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.reviews enable row level security;

revoke all on table public.reviews from anon, authenticated;

-- Visitors can only read approved reviews.
grant select on table public.reviews to anon, authenticated;

create policy "Anyone can read approved reviews"
on public.reviews
for select
to anon, authenticated
using (status = 'approved');

-- Visitors can submit a pending review, but cannot mark it verified or approved.
grant insert on table public.reviews to anon, authenticated;

create policy "Visitors can submit pending reviews"
on public.reviews
for insert
to anon, authenticated
with check (
  status = 'pending'
  and verified_purchase = false
);

-- No browser-side update/delete privileges.
-- Moderation and purchase verification should be done from a trusted server/admin workflow.
