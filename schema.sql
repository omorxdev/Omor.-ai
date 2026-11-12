-- Starter schema. Apply only after backend authorization and RLS policies are reviewed.
create extension if not exists pgcrypto;

create table if not exists public.device_profiles (
  id uuid primary key default gen_random_uuid(),
  device_id text not null unique,
  nickname text,
  created_at timestamptz not null default now(),
  last_seen_at timestamptz
);

create table if not exists public.conversations (
  id uuid primary key default gen_random_uuid(),
  device_id text not null,
  title text not null default 'New chat',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references public.conversations(id) on delete cascade,
  role text not null check (role in ('user', 'assistant', 'tool')),
  content text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.owner_devices (
  id uuid primary key default gen_random_uuid(),
  device_id text not null unique,
  token_hash text not null,
  created_at timestamptz not null default now(),
  expires_at timestamptz not null,
  revoked_at timestamptz
);

create table if not exists public.audit_events (
  id bigserial primary key,
  device_id text,
  event_type text not null,
  safe_metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists messages_conversation_created_idx
  on public.messages(conversation_id, created_at);
create index if not exists conversations_device_updated_idx
  on public.conversations(device_id, updated_at desc);

-- Do not expose these tables directly to anon clients.
-- Keep database access behind a trusted server/Edge Function until device-bound
-- authorization and row-level policies are implemented and tested.
alter table public.device_profiles enable row level security;
alter table public.conversations enable row level security;
alter table public.messages enable row level security;
alter table public.owner_devices enable row level security;
alter table public.audit_events enable row level security;
