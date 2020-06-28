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

# Common files
require 'postfinancecheckout-ruby-sdk/api_client'
require 'postfinancecheckout-ruby-sdk/api_error'
require 'postfinancecheckout-ruby-sdk/version'
require 'postfinancecheckout-ruby-sdk/configuration'

# Models
require 'postfinancecheckout-ruby-sdk/models/abstract_account_update'
require 'postfinancecheckout-ruby-sdk/models/abstract_application_user_update'
require 'postfinancecheckout-ruby-sdk/models/abstract_customer_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_customer_address_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_customer_comment_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_human_user_update'
require 'postfinancecheckout-ruby-sdk/models/abstract_refund_comment_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_space_update'
require 'postfinancecheckout-ruby-sdk/models/abstract_transaction_comment_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_transaction_invoice_comment_active'
require 'postfinancecheckout-ruby-sdk/models/abstract_transaction_pending'
require 'postfinancecheckout-ruby-sdk/models/abstract_webhook_listener_update'
require 'postfinancecheckout-ruby-sdk/models/abstract_webhook_url_update'
require 'postfinancecheckout-ruby-sdk/models/account'
require 'postfinancecheckout-ruby-sdk/models/account_state'
require 'postfinancecheckout-ruby-sdk/models/account_type'
require 'postfinancecheckout-ruby-sdk/models/address'
require 'postfinancecheckout-ruby-sdk/models/address_create'
require 'postfinancecheckout-ruby-sdk/models/charge_attempt_environment'
require 'postfinancecheckout-ruby-sdk/models/charge_attempt_state'
require 'postfinancecheckout-ruby-sdk/models/charge_flow'
require 'postfinancecheckout-ruby-sdk/models/charge_flow_level_configuration'
require 'postfinancecheckout-ruby-sdk/models/charge_flow_level_configuration_type'
require 'postfinancecheckout-ruby-sdk/models/charge_flow_level_state'
require 'postfinancecheckout-ruby-sdk/models/charge_state'
require 'postfinancecheckout-ruby-sdk/models/charge_type'
require 'postfinancecheckout-ruby-sdk/models/client_error'
require 'postfinancecheckout-ruby-sdk/models/client_error_type'
require 'postfinancecheckout-ruby-sdk/models/completion_line_item'
require 'postfinancecheckout-ruby-sdk/models/completion_line_item_create'
require 'postfinancecheckout-ruby-sdk/models/condition'
require 'postfinancecheckout-ruby-sdk/models/condition_type'
require 'postfinancecheckout-ruby-sdk/models/connector_invocation_stage'
require 'postfinancecheckout-ruby-sdk/models/creation_entity_state'
require 'postfinancecheckout-ruby-sdk/models/criteria_operator'
require 'postfinancecheckout-ruby-sdk/models/customer'
require 'postfinancecheckout-ruby-sdk/models/customer_address'
require 'postfinancecheckout-ruby-sdk/models/customer_address_type'
require 'postfinancecheckout-ruby-sdk/models/customer_comment'
require 'postfinancecheckout-ruby-sdk/models/customer_postal_address'
require 'postfinancecheckout-ruby-sdk/models/customer_postal_address_create'
require 'postfinancecheckout-ruby-sdk/models/customers_presence'
require 'postfinancecheckout-ruby-sdk/models/data_collection_type'
require 'postfinancecheckout-ruby-sdk/models/database_translated_string'
require 'postfinancecheckout-ruby-sdk/models/database_translated_string_item'
require 'postfinancecheckout-ruby-sdk/models/delivery_indication_decision_reason'
require 'postfinancecheckout-ruby-sdk/models/delivery_indication_state'
require 'postfinancecheckout-ruby-sdk/models/document_template_type'
require 'postfinancecheckout-ruby-sdk/models/document_template_type_group'
require 'postfinancecheckout-ruby-sdk/models/entity_export_request'
require 'postfinancecheckout-ruby-sdk/models/entity_query'
require 'postfinancecheckout-ruby-sdk/models/entity_query_filter'
require 'postfinancecheckout-ruby-sdk/models/entity_query_filter_type'
require 'postfinancecheckout-ruby-sdk/models/entity_query_order_by'
require 'postfinancecheckout-ruby-sdk/models/entity_query_order_by_type'
require 'postfinancecheckout-ruby-sdk/models/environment'
require 'postfinancecheckout-ruby-sdk/models/failure_category'
require 'postfinancecheckout-ruby-sdk/models/failure_reason'
require 'postfinancecheckout-ruby-sdk/models/feature'
require 'postfinancecheckout-ruby-sdk/models/feature_category'
require 'postfinancecheckout-ruby-sdk/models/gender'
require 'postfinancecheckout-ruby-sdk/models/human_user'
require 'postfinancecheckout-ruby-sdk/models/label'
require 'postfinancecheckout-ruby-sdk/models/label_descriptor'
require 'postfinancecheckout-ruby-sdk/models/label_descriptor_category'
require 'postfinancecheckout-ruby-sdk/models/label_descriptor_group'
require 'postfinancecheckout-ruby-sdk/models/label_descriptor_type'
require 'postfinancecheckout-ruby-sdk/models/legal_organization_form'
require 'postfinancecheckout-ruby-sdk/models/line_item'
require 'postfinancecheckout-ruby-sdk/models/line_item_attribute'
require 'postfinancecheckout-ruby-sdk/models/line_item_attribute_create'
require 'postfinancecheckout-ruby-sdk/models/line_item_create'
require 'postfinancecheckout-ruby-sdk/models/line_item_reduction'
require 'postfinancecheckout-ruby-sdk/models/line_item_reduction_create'
require 'postfinancecheckout-ruby-sdk/models/line_item_type'
require 'postfinancecheckout-ruby-sdk/models/localized_string'
require 'postfinancecheckout-ruby-sdk/models/manual_task'
require 'postfinancecheckout-ruby-sdk/models/manual_task_action'
require 'postfinancecheckout-ruby-sdk/models/manual_task_action_style'
require 'postfinancecheckout-ruby-sdk/models/manual_task_state'
require 'postfinancecheckout-ruby-sdk/models/manual_task_type'
require 'postfinancecheckout-ruby-sdk/models/one_click_payment_mode'
require 'postfinancecheckout-ruby-sdk/models/payment_connector'
require 'postfinancecheckout-ruby-sdk/models/payment_connector_configuration'
require 'postfinancecheckout-ruby-sdk/models/payment_connector_feature'
require 'postfinancecheckout-ruby-sdk/models/payment_contract'
require 'postfinancecheckout-ruby-sdk/models/payment_contract_state'
require 'postfinancecheckout-ruby-sdk/models/payment_contract_type'
require 'postfinancecheckout-ruby-sdk/models/payment_information_hash'
require 'postfinancecheckout-ruby-sdk/models/payment_information_hash_type'
require 'postfinancecheckout-ruby-sdk/models/payment_method'
require 'postfinancecheckout-ruby-sdk/models/payment_method_brand'
require 'postfinancecheckout-ruby-sdk/models/payment_method_configuration'
require 'postfinancecheckout-ruby-sdk/models/payment_primary_risk_taker'
require 'postfinancecheckout-ruby-sdk/models/payment_processor'
require 'postfinancecheckout-ruby-sdk/models/payment_processor_configuration'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_address'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_configuration'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_configuration_state'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_configuration_version'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_configuration_version_state'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_location'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_location_state'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_location_version'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_location_version_state'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_state'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_type'
require 'postfinancecheckout-ruby-sdk/models/permission'
require 'postfinancecheckout-ruby-sdk/models/refund'
require 'postfinancecheckout-ruby-sdk/models/refund_comment'
require 'postfinancecheckout-ruby-sdk/models/refund_create'
require 'postfinancecheckout-ruby-sdk/models/refund_state'
require 'postfinancecheckout-ruby-sdk/models/refund_type'
require 'postfinancecheckout-ruby-sdk/models/rendered_document'
require 'postfinancecheckout-ruby-sdk/models/resource_path'
require 'postfinancecheckout-ruby-sdk/models/resource_state'
require 'postfinancecheckout-ruby-sdk/models/rest_address_format'
require 'postfinancecheckout-ruby-sdk/models/rest_address_format_field'
require 'postfinancecheckout-ruby-sdk/models/rest_country'
require 'postfinancecheckout-ruby-sdk/models/rest_country_state'
require 'postfinancecheckout-ruby-sdk/models/rest_currency'
require 'postfinancecheckout-ruby-sdk/models/rest_language'
require 'postfinancecheckout-ruby-sdk/models/role'
require 'postfinancecheckout-ruby-sdk/models/sales_channel'
require 'postfinancecheckout-ruby-sdk/models/scope'
require 'postfinancecheckout-ruby-sdk/models/server_error'
require 'postfinancecheckout-ruby-sdk/models/space'
require 'postfinancecheckout-ruby-sdk/models/space_address'
require 'postfinancecheckout-ruby-sdk/models/space_address_create'
require 'postfinancecheckout-ruby-sdk/models/space_view'
require 'postfinancecheckout-ruby-sdk/models/static_value'
require 'postfinancecheckout-ruby-sdk/models/tax'
require 'postfinancecheckout-ruby-sdk/models/tax_create'
require 'postfinancecheckout-ruby-sdk/models/tenant_database'
require 'postfinancecheckout-ruby-sdk/models/token'
require 'postfinancecheckout-ruby-sdk/models/token_version'
require 'postfinancecheckout-ruby-sdk/models/token_version_state'
require 'postfinancecheckout-ruby-sdk/models/token_version_type'
require 'postfinancecheckout-ruby-sdk/models/tokenization_mode'
require 'postfinancecheckout-ruby-sdk/models/transaction'
require 'postfinancecheckout-ruby-sdk/models/transaction_aware_entity'
require 'postfinancecheckout-ruby-sdk/models/transaction_comment'
require 'postfinancecheckout-ruby-sdk/models/transaction_completion_mode'
require 'postfinancecheckout-ruby-sdk/models/transaction_completion_request'
require 'postfinancecheckout-ruby-sdk/models/transaction_completion_state'
require 'postfinancecheckout-ruby-sdk/models/transaction_environment_selection_strategy'
require 'postfinancecheckout-ruby-sdk/models/transaction_group'
require 'postfinancecheckout-ruby-sdk/models/transaction_group_state'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice_comment'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice_replacement'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice_state'
require 'postfinancecheckout-ruby-sdk/models/transaction_line_item_update_request'
require 'postfinancecheckout-ruby-sdk/models/transaction_state'
require 'postfinancecheckout-ruby-sdk/models/transaction_user_interface_type'
require 'postfinancecheckout-ruby-sdk/models/transaction_void_mode'
require 'postfinancecheckout-ruby-sdk/models/transaction_void_state'
require 'postfinancecheckout-ruby-sdk/models/two_factor_authentication_type'
require 'postfinancecheckout-ruby-sdk/models/user'
require 'postfinancecheckout-ruby-sdk/models/user_account_role'
require 'postfinancecheckout-ruby-sdk/models/user_space_role'
require 'postfinancecheckout-ruby-sdk/models/user_type'
require 'postfinancecheckout-ruby-sdk/models/webhook_identity'
require 'postfinancecheckout-ruby-sdk/models/webhook_listener'
require 'postfinancecheckout-ruby-sdk/models/webhook_listener_entity'
require 'postfinancecheckout-ruby-sdk/models/webhook_url'
require 'postfinancecheckout-ruby-sdk/models/account_create'
require 'postfinancecheckout-ruby-sdk/models/account_update'
require 'postfinancecheckout-ruby-sdk/models/application_user'
require 'postfinancecheckout-ruby-sdk/models/application_user_create'
require 'postfinancecheckout-ruby-sdk/models/application_user_update'
require 'postfinancecheckout-ruby-sdk/models/charge'
require 'postfinancecheckout-ruby-sdk/models/charge_attempt'
require 'postfinancecheckout-ruby-sdk/models/charge_flow_level'
require 'postfinancecheckout-ruby-sdk/models/charge_flow_level_payment_link'
require 'postfinancecheckout-ruby-sdk/models/connector_invocation'
require 'postfinancecheckout-ruby-sdk/models/customer_active'
require 'postfinancecheckout-ruby-sdk/models/customer_address_active'
require 'postfinancecheckout-ruby-sdk/models/customer_address_create'
require 'postfinancecheckout-ruby-sdk/models/customer_comment_active'
require 'postfinancecheckout-ruby-sdk/models/customer_comment_create'
require 'postfinancecheckout-ruby-sdk/models/customer_create'
require 'postfinancecheckout-ruby-sdk/models/delivery_indication'
require 'postfinancecheckout-ruby-sdk/models/human_user_create'
require 'postfinancecheckout-ruby-sdk/models/human_user_update'
require 'postfinancecheckout-ruby-sdk/models/payment_terminal_contact_address'
require 'postfinancecheckout-ruby-sdk/models/refund_comment_active'
require 'postfinancecheckout-ruby-sdk/models/refund_comment_create'
require 'postfinancecheckout-ruby-sdk/models/space_create'
require 'postfinancecheckout-ruby-sdk/models/space_update'
require 'postfinancecheckout-ruby-sdk/models/transaction_comment_active'
require 'postfinancecheckout-ruby-sdk/models/transaction_comment_create'
require 'postfinancecheckout-ruby-sdk/models/transaction_completion'
require 'postfinancecheckout-ruby-sdk/models/transaction_create'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice_comment_active'
require 'postfinancecheckout-ruby-sdk/models/transaction_invoice_comment_create'
require 'postfinancecheckout-ruby-sdk/models/transaction_line_item_version'
require 'postfinancecheckout-ruby-sdk/models/transaction_pending'
require 'postfinancecheckout-ruby-sdk/models/transaction_void'
require 'postfinancecheckout-ruby-sdk/models/webhook_listener_create'
require 'postfinancecheckout-ruby-sdk/models/webhook_listener_update'
require 'postfinancecheckout-ruby-sdk/models/webhook_url_create'
require 'postfinancecheckout-ruby-sdk/models/webhook_url_update'
require 'postfinancecheckout-ruby-sdk/models/application_user_create_with_mac_key'

# APIs
require 'postfinancecheckout-ruby-sdk/api/account_service_api'
require 'postfinancecheckout-ruby-sdk/api/application_user_service_api'
require 'postfinancecheckout-ruby-sdk/api/charge_attempt_service_api'
require 'postfinancecheckout-ruby-sdk/api/charge_flow_level_payment_link_service_api'
require 'postfinancecheckout-ruby-sdk/api/charge_flow_level_service_api'
require 'postfinancecheckout-ruby-sdk/api/charge_flow_service_api'
require 'postfinancecheckout-ruby-sdk/api/condition_type_service_api'
require 'postfinancecheckout-ruby-sdk/api/country_service_api'
require 'postfinancecheckout-ruby-sdk/api/country_state_service_api'
require 'postfinancecheckout-ruby-sdk/api/currency_service_api'
require 'postfinancecheckout-ruby-sdk/api/customer_address_service_api'
require 'postfinancecheckout-ruby-sdk/api/customer_comment_service_api'
require 'postfinancecheckout-ruby-sdk/api/customer_service_api'
require 'postfinancecheckout-ruby-sdk/api/delivery_indication_service_api'
require 'postfinancecheckout-ruby-sdk/api/human_user_service_api'
require 'postfinancecheckout-ruby-sdk/api/label_description_group_service_api'
require 'postfinancecheckout-ruby-sdk/api/label_description_service_api'
require 'postfinancecheckout-ruby-sdk/api/language_service_api'
require 'postfinancecheckout-ruby-sdk/api/legal_organization_form_service_api'
require 'postfinancecheckout-ruby-sdk/api/manual_task_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_connector_configuration_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_connector_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_method_brand_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_method_configuration_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_method_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_processor_configuration_service_api'
require 'postfinancecheckout-ruby-sdk/api/payment_processor_service_api'
require 'postfinancecheckout-ruby-sdk/api/permission_service_api'
require 'postfinancecheckout-ruby-sdk/api/refund_comment_service_api'
require 'postfinancecheckout-ruby-sdk/api/refund_service_api'
require 'postfinancecheckout-ruby-sdk/api/space_service_api'
require 'postfinancecheckout-ruby-sdk/api/static_value_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_comment_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_completion_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_iframe_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_invoice_comment_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_invoice_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_lightbox_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_mobile_sdk_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_payment_page_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_service_api'
require 'postfinancecheckout-ruby-sdk/api/transaction_void_service_api'
require 'postfinancecheckout-ruby-sdk/api/user_account_role_service_api'
require 'postfinancecheckout-ruby-sdk/api/user_space_role_service_api'
require 'postfinancecheckout-ruby-sdk/api/webhook_listener_service_api'
require 'postfinancecheckout-ruby-sdk/api/webhook_url_service_api'

module PostFinanceCheckout
  class << self
    # Customize default settings for the SDK using block.
    #   PostFinanceCheckout.configure do |config|
    #     config.user_id = "xxx"
    #     config.authentication_key = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
