# PostFinance Checkout Ruby Library

The PostFinance Checkout Ruby library wraps around the PostFinance Checkout API. This library facilitates your interaction with various services such as transactions, accounts, and subscriptions.

## Documentation

[PostFinance Checkout Web Service API](https://checkout.postfinance.ch/doc/api/web-service)

## Requirements

- Ruby 3.0.0+

## Installation

# RubyGem install (recommended)

```sh
$ gem install postfinancecheckout-ruby-sdk
```

## Usage
The library needs to be configured with your account's space id, user id, and secret key which are available in your [PostFinance Checkout
account dashboard](https://checkout.postfinance.ch/account/select). Set `space_id`, `user_id`, and `api_secret` to their values. You can also optionally set `default_headers` to set some headers that will be sent to all requests:

### Configuring a Service

```ruby
require 'postfinancecheckout-ruby-sdk'

space_id = 405
app_user_id = 512
app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="

# default_headers is an optional param, that represents headers sent to all requests
# timeout is an optional param, that allows to configure custom timeout (default is 25 seconds)
PostFinanceCheckout.configure do |config|
  config.user_id = app_user_id
  config.authentication_key = app_user_key
  config.default_headers = {"x-meta-custom-header": 'value-1', "x-meta-custom-header-2": 'value-2'}
  config.timeout = 60
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

# timeout is an optional param, that allows to configure custom timeout (default is 25 seconds)
PostFinanceCheckout.configure do |config|
    config.user_id = app_user_id
    config.authentication_key = app_user_key
    config.timeout = 60
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

### Integrating Webhook Payload Signing Mechanism into webhook callback handler

The HTTP request which is sent for a state change of an entity now includes an additional field `state`, which provides information about the update of the monitored entity's state. This enhancement is a result of the implementation of our webhook encryption mechanism.

Payload field `state` provides direct information about the state update of the entity, making additional API calls to retrieve the entity state redundant.

#### ⚠️ Warning: Generic Pseudocode

> **The provided pseudocode is intentionally generic and serves to illustrate the process of enhancing your API to leverage webhook payload signing. It is not a complete implementation.**
>
> Please ensure that you adapt and extend this code to meet the specific needs of your application, including appropriate security measures and error handling.
For a detailed webhook payload signing mechanism understanding we highly recommend referring to our comprehensive
[Webhook Payload Signing Documentation](https://checkout.postfinance.ch/doc/webhooks#_webhook_payload_signing_mechanism).

```ruby
post '/webhook/callback' do
    request_payload = request.body.read
    signature = request.env['HTTP_X_SIGNATURE']

    if signature.nil? || signature.empty?
        # Make additional API call to retrieve the entity state
        # ...
    else
        if webhook_encryption_service.is_content_valid(signature, request_payload)
            # Parse request_payload to extract 'state' value
            # Process entity's state change
            # ...
        end
    end

    # Process the received webhook data
    # ...
end
```

## License

Please see the [license file](https://github.com/pfpayments/ruby-sdk/blob/master/LICENSE) for more information.
