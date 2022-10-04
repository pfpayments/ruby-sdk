require 'test/unit'
require 'postfinancecheckout-ruby-sdk'

class TestConditionTypeAll < Test::Unit::TestCase

  def test_condition_type_all
    
    app_user_id = 512
    app_user_key = "FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ="
    
    PostFinanceCheckout.configure do |config|
      config.user_id = app_user_id
      config.authentication_key = app_user_key
      config.default_headers = {"x-meta-header-ruby": 'value', "x-meta-header-ruby-2": 'value2'}
    end

    condition_type_service = PostFinanceCheckout::ConditionTypeService.new

    condition_types, status_code = condition_type_service.all_with_http_info()
    assert_equal(200, status_code)
  end
  
end
