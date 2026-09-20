# Chirptopia Reviews — Setup

The storefront now contains a customer review UI and is ready for a real review database.

## 1. Create the review database

Create a Supabase project, open **SQL Editor**, and run:

`supabase_reviews.sql`

The SQL enables Row Level Security so visitors can read only approved reviews and submit only pending/unverified reviews. Purchase verification and approval should happen from a trusted backend/admin workflow.

## 2. Connect the storefront

In `index.html`, find:

`const REVIEWS_CONFIG={supabaseUrl:"",supabaseAnonKey:"",table:"reviews"};`

Add your Supabase project URL and publishable/anon key.

Do not put a Supabase service-role key in the website.

## 3. Verified purchases

The browser must never decide that a customer is a verified buyer. After payment is connected, the payment/order backend should verify the order and then mark the matching review as `verified_purchase=true` and `status='approved'` (after moderation, if desired).

## 4. Payment + delivery

The current checkout is intentionally a placeholder. A payment provider must be connected before accepting real money. The next production step is to connect the store to a digital-commerce/payment platform, configure the product price, upload the final PDF, and enable automatic delivery after successful payment.

## Current product assumptions

- Product shown: Screen-Free Adventures for Kids
- Display price: $12.99 (confirm your final price before launch)
- Product type in the storefront: digital product
- Reviews: pending until backend + moderation are connected

