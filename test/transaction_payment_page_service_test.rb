require 'test/unit'
require 'postfinancecheckout-ruby-sdk'

class TestTransactionCreate < Test::Unit::TestCase

  def test_payment_page_url
    
    space_id = 405
    app_user_id = 512
    app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="
    
    PostFinanceCheckout.configure do |config|
      config.user_id = app_user_id
      config.authentication_key = app_user_key
      config.default_headers = {"x-meta-header-ruby": 'value', "x-meta-header-ruby-2": 'value2'}
    end

    transaction_service = PostFinanceCheckout::TransactionService.new
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
    payment_page_url, status_code = transaction_payment_page_service.payment_page_url_with_http_info(space_id, transaction.id)
    assert_equal(200, status_code )
    assert_send([payment_page_url, :include?, "http"])
    assert_equal(space_id, transaction.linked_space_id)
  end
  
end
