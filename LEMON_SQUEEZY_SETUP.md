# Lemon Squeezy Launch Setup

This storefront is prepared to use Lemon Squeezy for the payment and digital-delivery layer.

## What is already implemented

- The storefront has a cart and checkout form.
- The site has a single checkout configuration value in `index.html`:
  `CHECKOUT_URL`
- When `CHECKOUT_URL` is filled with the published Lemon Squeezy checkout URL, the checkout form sends the customer to Lemon Squeezy.
- Customer name, email, and country can be passed into the checkout as prefilled fields.
- The site keeps the payment provider key out of the browser; only the public checkout URL is used.
- Lemon Squeezy can deliver uploaded digital files after purchase, so the PDF does not need to be stored publicly on GitHub Pages.

## 1. Create the product

In Lemon Squeezy:

1. Create a product named **Screen-Free Adventures for Kids**.
2. Set the final price you want to charge.
3. Upload the final PDF as the product file.
4. Add a product description and product images.
5. Publish the product when you are ready.

Lemon Squeezy supports digital product files and provides customers access to purchased files through receipts/account access.

## 2. Get the checkout URL

From the product's Share options, copy the original checkout URL.

It should look like:

`https://YOUR-STORE.lemonsqueezy.com/checkout/buy/YOUR-VARIANT-ID`

Do not copy a customer-specific cart URL containing `/checkout/?cart=`.

## 3. Connect the storefront

Open `index.html` and find:

```js
const CHECKOUT_URL="";
```

Replace it with:

```js
const CHECKOUT_URL="https://YOUR-STORE.lemonsqueezy.com/checkout/buy/YOUR-VARIANT-ID";
```

Commit the change and wait for GitHub Pages to deploy.

## 4. Test before going live

Use Lemon Squeezy test mode first.

Test:

- Checkout opens correctly.
- Customer details reach checkout.
- Payment completion works in test mode.
- The product file is attached to the product.
- The receipt/download experience works as expected.

Test-mode purchases do not enable real file downloads, so perform the final delivery check with a real/live purchase after activation.

## 5. Automatic delivery

For this product, the simplest fulfillment path is to let Lemon Squeezy host the PDF as the digital product file.

This avoids exposing the PDF directly from the GitHub Pages website.

## 6. Reviews

The storefront already has a Supabase review schema and frontend.

For a stronger verified-review system later, connect a server-side order/webhook workflow that can confirm Lemon Squeezy orders before setting:

`verified_purchase=true`

Never expose a Lemon Squeezy API key or webhook signing secret in `index.html`.

## Important launch checks

Before accepting real orders, confirm:

- Final PDF is complete and licensed for sale.
- Final price is correct.
- Product title and description are final.
- Lemon Squeezy store is activated.
- Payout method is configured.
- Checkout URL is live.
- The website no longer shows "checkout setup in progress".
- The purchase and download flow has been tested.

## Official documentation

- Lemon Squeezy Getting Started: https://docs.lemonsqueezy.com/guides/getting-started
- Taking Payments: https://docs.lemonsqueezy.com/guides/developer-guide/taking-payments
- Adding Products: https://docs.lemonsqueezy.com/help/products/adding-products
- Hosted Checkout: https://docs.lemonsqueezy.com/help/checkout/hosted-checkout
- Test Mode: https://docs.lemonsqueezy.com/help/getting-started/test-mode
