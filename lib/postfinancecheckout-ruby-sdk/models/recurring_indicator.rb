=begin
The PostFinance Checkout API allows an easy interaction with the PostFinance Checkout web service.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'date'

module PostFinanceCheckout
  class RecurringIndicator
    
    REGULAR_TRANSACTION = 'REGULAR_TRANSACTION'.freeze
    INITIAL_RECURRING_TRANSACTION = 'INITIAL_RECURRING_TRANSACTION'.freeze
    MERCHANT_INITIATED_RECURRING_TRANSACTION = 'MERCHANT_INITIATED_RECURRING_TRANSACTION'.freeze
    CUSTOMER_INITIATED_RECURRING_TRANSACTION = 'CUSTOMER_INITIATED_RECURRING_TRANSACTION'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = RecurringIndicator.constants.select { |c| RecurringIndicator::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #RecurringIndicator" if constantValues.empty?
      value
    end
  end
end
