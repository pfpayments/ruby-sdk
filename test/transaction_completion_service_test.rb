require "test/unit"
require 'postfinancecheckout-ruby-sdk'

require_relative "constants.rb"

class TestTransactionCompletionService < Test::Unit::TestCase

  class << self
    def startup
      @@transaction_service = PostFinanceCheckout::TransactionService.new
      
      @@transaction_completion_service = PostFinanceCheckout::TransactionCompletionService.new

      @@card_processing_service = PostFinanceCheckout::CardProcessingService.new

    end
  end

  description "complete_offline() should complete transaction offline (completion is NOT forwarded to processor)"
  def test_complete_offline
    transaction = @@transaction_service.create(SPACE_ID, get_deferred_transaction_create)

    transaction_processed = @@card_processing_service.process(SPACE_ID, transaction.id, 
      TEST_CARD_PAYMENT_METHOD_CONFIGURATION_ID, FAKE_CARD_DATA)

    assert_equal(PostFinanceCheckout::TransactionState::AUTHORIZED, transaction_processed.state,
      "State must be AUTHORIZED")

    transaction_completion = @@transaction_completion_service.complete_offline(SPACE_ID, transaction_processed.id)

    assert_equal(PostFinanceCheckout::TransactionCompletionState::SUCCESSFUL, transaction_completion.state,
      "State must be SUCCESSFUL")
  end

  description "complete_online() should complete transaction online (completion is forwarded to processor)"
  def test_complete_online
    transaction = @@transaction_service.create(SPACE_ID, get_deferred_transaction_create)

    transaction_processed = @@card_processing_service.process(SPACE_ID, transaction.id, 
      TEST_CARD_PAYMENT_METHOD_CONFIGURATION_ID, FAKE_CARD_DATA)

    assert_equal(PostFinanceCheckout::TransactionState::AUTHORIZED, transaction_processed.state,
      "State must be AUTHORIZED")

    transaction_completion = @@transaction_completion_service.complete_online(SPACE_ID, transaction_processed.id)

    assert_equal(PostFinanceCheckout::TransactionCompletionState::SUCCESSFUL, transaction_completion.state,
      "State must be SUCCESSFUL")
  end

  description "read() should read details of transaction completion by id"
  def test_read
    transaction = @@transaction_service.create(SPACE_ID, get_deferred_transaction_create)

    transaction_processed = @@card_processing_service.process(SPACE_ID, transaction.id, 
      TEST_CARD_PAYMENT_METHOD_CONFIGURATION_ID, FAKE_CARD_DATA)

    assert_equal(PostFinanceCheckout::TransactionState::AUTHORIZED, transaction_processed.state,
      "State must be AUTHORIZED")

    transaction_completion = @@transaction_completion_service.complete_online(SPACE_ID, transaction_processed.id)

    transaction_read = @@transaction_completion_service.read(SPACE_ID, transaction_completion.id)

    assert_equal(transaction_completion.id, transaction_read.id,
      "Transaction ids must match")
  end


  description "count() should count transaction completions based on provided criteria"
  def test_count
    transaction = @@transaction_service.create(SPACE_ID, get_deferred_transaction_create)

    transaction_processed = @@card_processing_service.process(SPACE_ID, transaction.id, 
      TEST_CARD_PAYMENT_METHOD_CONFIGURATION_ID, FAKE_CARD_DATA)

    transaction_completion = @@transaction_completion_service.complete_online(SPACE_ID, transaction_processed.id)

    criteria = {
      filter: PostFinanceCheckout::EntityQueryFilter.new({
          fieldName: "id",
          value: transaction_completion.id,
          type: PostFinanceCheckout::EntityQueryFilterType::LEAF,
          operator: PostFinanceCheckout::CriteriaOperator::EQUALS
      })
    }

    count = @@transaction_completion_service.count(SPACE_ID, criteria)

    assert_equal(1, count, "Count of completions should be 1")
  end

  private

  def get_deferred_transaction_create
    transaction_create = get_transaction_create
    transaction_create.tokenization_mode = PostFinanceCheckout::TokenizationMode::FORCE_CREATION
    transaction_create.customers_presence = PostFinanceCheckout::CustomersPresence::NOT_PRESENT
    transaction_create.completion_behavior = PostFinanceCheckout::TransactionCompletionBehavior::COMPLETE_DEFERRED

    transaction_create
  end

end
