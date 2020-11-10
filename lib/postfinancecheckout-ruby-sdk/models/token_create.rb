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
  # 
  class TokenCreate
    # The customer email address is the email address of the customer.
    attr_accessor :customer_email_address

    # The customer ID identifies the customer in the merchant system. In case the customer ID has been provided it has to correspond with the customer ID provided on the transaction. The customer ID will not be changed automatically. The merchant system has to provide it.
    attr_accessor :customer_id

    # When a token is enabled for one-click payments the buyer will be able to select the token within the iFrame or on the payment page to pay with the token. The usage of the token will reduce the number of steps the buyer has to go through. The buyer is linked via the customer ID on the transaction with the token. Means the token will be visible for buyers with the same customer ID. Additionally the payment method has to be configured to allow the one-click payments.
    attr_accessor :enabled_for_one_click_payment

    # 
    attr_accessor :language

    # The time zone defines in which time zone the customer is located in. The time zone may affects how dates are formatted when interacting with the customer.
    attr_accessor :time_zone

    # Use something that it is easy to identify and may help you find the token (e.g. customer id, email address).
    attr_accessor :token_reference

    # The external id helps to identify the entity and a subsequent creation of an entity with the same ID will not create a new entity.
    attr_accessor :external_id

    # 
    attr_accessor :state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'customer_email_address' => :'customerEmailAddress',
        :'customer_id' => :'customerId',
        :'enabled_for_one_click_payment' => :'enabledForOneClickPayment',
        :'language' => :'language',
        :'time_zone' => :'timeZone',
        :'token_reference' => :'tokenReference',
        :'external_id' => :'externalId',
        :'state' => :'state'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'customer_email_address' => :'String',
        :'customer_id' => :'String',
        :'enabled_for_one_click_payment' => :'BOOLEAN',
        :'language' => :'String',
        :'time_zone' => :'String',
        :'token_reference' => :'String',
        :'external_id' => :'String',
        :'state' => :'CreationEntityState'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'customerEmailAddress')
        self.customer_email_address = attributes[:'customerEmailAddress']
      end

      if attributes.has_key?(:'customerId')
        self.customer_id = attributes[:'customerId']
      end

      if attributes.has_key?(:'enabledForOneClickPayment')
        self.enabled_for_one_click_payment = attributes[:'enabledForOneClickPayment']
      end

      if attributes.has_key?(:'language')
        self.language = attributes[:'language']
      end

      if attributes.has_key?(:'timeZone')
        self.time_zone = attributes[:'timeZone']
      end

      if attributes.has_key?(:'tokenReference')
        self.token_reference = attributes[:'tokenReference']
      end

      if attributes.has_key?(:'externalId')
        self.external_id = attributes[:'externalId']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@customer_email_address.nil? && @customer_email_address.to_s.length > 150
        invalid_properties.push('invalid value for "customer_email_address", the character length must be smaller than or equal to 150.')
      end

      if !@token_reference.nil? && @token_reference.to_s.length > 100
        invalid_properties.push('invalid value for "token_reference", the character length must be smaller than or equal to 100.')
      end

      if @external_id.nil?
        invalid_properties.push('invalid value for "external_id", external_id cannot be nil.')
      end

      if @external_id.to_s.length > 100
        invalid_properties.push('invalid value for "external_id", the character length must be smaller than or equal to 100.')
      end

      if @external_id.to_s.length < 1
        invalid_properties.push('invalid value for "external_id", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@customer_email_address.nil? && @customer_email_address.to_s.length > 150
      return false if !@token_reference.nil? && @token_reference.to_s.length > 100
      return false if @external_id.nil?
      return false if @external_id.to_s.length > 100
      return false if @external_id.to_s.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] customer_email_address Value to be assigned
    def customer_email_address=(customer_email_address)
      if !customer_email_address.nil? && customer_email_address.to_s.length > 150
        fail ArgumentError, 'invalid value for "customer_email_address", the character length must be smaller than or equal to 150.'
      end

      @customer_email_address = customer_email_address
    end

    # Custom attribute writer method with validation
    # @param [Object] token_reference Value to be assigned
    def token_reference=(token_reference)
      if !token_reference.nil? && token_reference.to_s.length > 100
        fail ArgumentError, 'invalid value for "token_reference", the character length must be smaller than or equal to 100.'
      end

      @token_reference = token_reference
    end

    # Custom attribute writer method with validation
    # @param [Object] external_id Value to be assigned
    def external_id=(external_id)
      if external_id.nil?
        fail ArgumentError, 'external_id cannot be nil'
      end

      if external_id.to_s.length > 100
        fail ArgumentError, 'invalid value for "external_id", the character length must be smaller than or equal to 100.'
      end

      if external_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "external_id", the character length must be great than or equal to 1.'
      end

      @external_id = external_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          customer_email_address == o.customer_email_address &&
          customer_id == o.customer_id &&
          enabled_for_one_click_payment == o.enabled_for_one_click_payment &&
          language == o.language &&
          time_zone == o.time_zone &&
          token_reference == o.token_reference &&
          external_id == o.external_id &&
          state == o.state
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [customer_email_address, customer_id, enabled_for_one_click_payment, language, time_zone, token_reference, external_id, state].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = PostFinanceCheckout.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
