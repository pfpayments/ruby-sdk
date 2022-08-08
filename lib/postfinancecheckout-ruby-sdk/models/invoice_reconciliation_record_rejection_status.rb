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
  class InvoiceReconciliationRecordRejectionStatus
    
    NONE = 'NONE'.freeze
    REJECTED = 'REJECTED'.freeze
    BULK_REJECTED = 'BULK_REJECTED'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = InvoiceReconciliationRecordRejectionStatus.constants.select { |c| InvoiceReconciliationRecordRejectionStatus::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #InvoiceReconciliationRecordRejectionStatus" if constantValues.empty?
      value
    end
  end
end