# PostFinance Checkout Ruby Library

The PostFinance Checkout Ruby library wraps around the PostFinance Checkout API. This library facilitates your interaction with various services such as transactions, accounts, and subscriptions.

## Documentation

[PostFinance Checkout Web Service API](https://checkout.postfinance.ch/doc/api/web-service)

## Requirements

- Ruby 2.2+

## Installation

# RubyGem install (recommended)

```sh
$ gem install postfinancecheckout-ruby-sdk
```

## Usage
The library needs to be configured with your account's space id, user id, and secret key which are available in your [PostFinance Checkout
account dashboard](https://checkout.postfinance.ch/account/select). Set `space_id`, `user_id`, and `api_secret` to their values:

### Configuring a Service

```ruby
require 'postfinancecheckout-ruby-sdk'

space_id = 405
app_user_id = 512
app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="

PostFinanceCheckout.configure do |config|
  config.user_id = app_user_id
  config.authentication_key = app_user_key
end

# TransactionService
transaction_service = PostFinanceCheckout::TransactionService.new
# TransactionPaymentPageService
transaction_payment_page_service = PostFinanceCheckout::TransactionPaymentPageService.new
```

To get stated with sending transactions you can review the example below:

```ruby
require 'postfinancecheckout-ruby-sdk'

space_id = 405
app_user_id = 512
app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="

PostFinanceCheckout.configure do |config|
    config.user_id = app_user_id
    config.authentication_key = app_user_key
end

# TransactionService
transaction_service = PostFinanceCheckout::TransactionService.new
# TransactionPaymentPageService
transaction_payment_page_service = PostFinanceCheckout::TransactionPaymentPageService.new

transaction = PostFinanceCheckout::TransactionCreate.new({
    billingAddress: PostFinanceCheckout::AddressCreate.new({
        city: "City",
        country: "US",
        emailAddress: "billing@address.com",
        familyName: "Family",
        givenName: "Given",
        postCode: "98100",
        postalState: "WA",
        street: "Street"
    }),
    currency: 'EUR',
    customerEmailAddress: "test@example.com",
    customerPresence: PostFinanceCheckout::CustomersPresence::VIRTUAL_PRESENT,
    failedUrl: "http://localhost/failure",
    invoiceMerchantReference: "order-1",
    language: "en_US",
    lineItems: [
        PostFinanceCheckout::LineItemCreate.new({
            amountIncludingTax: 29.60,
            name: "Item 1",
            quantity: 1,
            shippingRequired: true,
            sku: "sku-1",
            taxes: [
                PostFinanceCheckout::TaxCreate.new({
                    rate: 8,
                    title: "VAT"
                })
            ],
            type: PostFinanceCheckout::LineItemType::PRODUCT,
            uniqueId: "unique-id-item-1",
        }),
        PostFinanceCheckout::LineItemCreate.new({
            amountIncludingTax: 5.60,
            name: "Test Shipping",
            quantity: 1,
            shippingRequired: false,
            sku: "test-shipping",
            taxes: [
                PostFinanceCheckout::TaxCreate.new({
                    rate: 8,
                    title: "VAT"
                })
            ],
            type: PostFinanceCheckout::LineItemType::SHIPPING,
            uniqueId: "unique-id-shipping-1",
        }),
    ],
    merchantReference: "order-1",
    shippingAddress: PostFinanceCheckout::AddressCreate.new({
        city: "City",
        country: "US",
        emailAddress: "shipping@address.com",
        familyName: "Family",
        givenName: "Given",
        postCode: "98100",
        postalState: "WA",
        street: "Street"
    }),
    shippingMethod: "Test Shipping",
    successUrl: "http://localhost/success"
})

transaction = transaction_service.create(space_id, transaction)
payment_page_url = transaction_payment_page_service.payment_page_url(space_id, transaction.id)
# redirect to payment_page_url
```

## License

Please see the [license file](https://github.com/pfpayments/ruby-sdk/blob/master/LICENSE) for more information.
