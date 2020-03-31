require 'test/unit'
require 'postfinancecheckout-ruby-sdk'

class TestTransactionCreate < Test::Unit::TestCase

  def test_create
    
    space_id = 405
    app_user_id = 512
    app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="
    
    PostFinanceCheckout.configure do |config|
      config.user_id = app_user_id
      config.authentication_key = app_user_key
    end

    transaction_service = PostFinanceCheckout::TransactionService.new
    
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
      customerEmailAddress: "test@customweb.com",
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

    transaction, status_code = transaction_service.transaction_service_create_with_http_info(space_id, transaction)
    assert_equal(200, status_code )
    assert_equal(35.2, transaction.authorization_amount)
    assert_equal(space_id, transaction.linked_space_id)
  end
  
end
