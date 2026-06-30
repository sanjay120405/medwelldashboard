-- Run this in your Supabase SQL Editor
-- https://ascolgmqofzoaqukkhvk.supabase.co

-- ── Wholesale Sales Table ──
create table if not exists wholesale_sales (
  id            uuid default gen_random_uuid() primary key,
  created_at    timestamptz default now(),
  txn_date      text,
  party         text,
  vch           text,
  taxable       numeric default 0,
  cgst          numeric default 0,
  sgst          numeric default 0,
  igst          numeric default 0,
  invoice       numeric default 0,
  transport     numeric default 0,
  margin        numeric default 0,
  commission    numeric default 0,
  netprofit     numeric default 0,
  payment       text default ''
);

-- ── Wholesale Purchase Table ──
create table if not exists wholesale_purchases (
  id            uuid default gen_random_uuid() primary key,
  created_at    timestamptz default now(),
  txn_date      text,
  party         text,
  vch           text,
  taxable       numeric default 0,
  cgst          numeric default 0,
  sgst          numeric default 0,
  igst          numeric default 0,
  invoice       numeric default 0,
  transport     numeric default 0,
  status        text default 'Pending'
);

-- ── Wholesale Expenses Table ──
create table if not exists wholesale_expenses (
  id          uuid default gen_random_uuid() primary key,
  created_at  timestamptz default now(),
  txn_date    text,
  amount      numeric default 0,
  exp_for     text,
  sub_for     text,
  amount_from text,
  amount_to   text,
  notes       text,
  remarks     text
);

-- ── Retail Sales Table ──
create table if not exists retail_sales (
  id           uuid default gen_random_uuid() primary key,
  created_at   timestamptz default now(),
  txn_date     text,
  invoice      text,
  patient_name text,
  phone        text,
  amount       numeric default 0,
  status       text default 'Paid'
);

-- ── Enable Row Level Security ──
alter table wholesale_sales     enable row level security;
alter table wholesale_purchases enable row level security;
alter table wholesale_expenses  enable row level security;
alter table retail_sales        enable row level security;

-- ── Allow full access via anon key (adjust as needed) ──
create policy "Allow all" on wholesale_sales     for all using (true) with check (true);
create policy "Allow all" on wholesale_purchases for all using (true) with check (true);
create policy "Allow all" on wholesale_expenses  for all using (true) with check (true);
create policy "Allow all" on retail_sales        for all using (true) with check (true);
