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
  class PaymentConnector
    # 
    attr_accessor :data_collection_type

    # 
    attr_accessor :deprecated

    # 
    attr_accessor :deprecation_reason

    # The localized description of the object.
    attr_accessor :description

    # 
    attr_accessor :feature

    # A unique identifier for the object.
    attr_accessor :id

    # The localized name of the object.
    attr_accessor :name

    # 
    attr_accessor :payment_method

    # 
    attr_accessor :payment_method_brand

    # 
    attr_accessor :primary_risk_taker

    # 
    attr_accessor :processor

    # 
    attr_accessor :supported_currencies

    # 
    attr_accessor :supported_customers_presences

    # 
    attr_accessor :supported_features

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'data_collection_type' => :'dataCollectionType',
        :'deprecated' => :'deprecated',
        :'deprecation_reason' => :'deprecationReason',
        :'description' => :'description',
        :'feature' => :'feature',
        :'id' => :'id',
        :'name' => :'name',
        :'payment_method' => :'paymentMethod',
        :'payment_method_brand' => :'paymentMethodBrand',
        :'primary_risk_taker' => :'primaryRiskTaker',
        :'processor' => :'processor',
        :'supported_currencies' => :'supportedCurrencies',
        :'supported_customers_presences' => :'supportedCustomersPresences',
        :'supported_features' => :'supportedFeatures'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'data_collection_type' => :'DataCollectionType',
        :'deprecated' => :'BOOLEAN',
        :'deprecation_reason' => :'Hash<String, String>',
        :'description' => :'Hash<String, String>',
        :'feature' => :'Feature',
        :'id' => :'Integer',
        :'name' => :'Hash<String, String>',
        :'payment_method' => :'Integer',
        :'payment_method_brand' => :'PaymentMethodBrand',
        :'primary_risk_taker' => :'PaymentPrimaryRiskTaker',
        :'processor' => :'Integer',
        :'supported_currencies' => :'Array<String>',
        :'supported_customers_presences' => :'Array<CustomersPresence>',
        :'supported_features' => :'Array<Integer>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'dataCollectionType')
        self.data_collection_type = attributes[:'dataCollectionType']
      end

      if attributes.has_key?(:'deprecated')
        self.deprecated = attributes[:'deprecated']
      end

      if attributes.has_key?(:'deprecationReason')
        if (value = attributes[:'deprecationReason']).is_a?(Hash)
          self.deprecation_reason = value
        end
      end

      if attributes.has_key?(:'description')
        if (value = attributes[:'description']).is_a?(Hash)
          self.description = value
        end
      end

      if attributes.has_key?(:'feature')
        self.feature = attributes[:'feature']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'name')
        if (value = attributes[:'name']).is_a?(Hash)
          self.name = value
        end
      end

      if attributes.has_key?(:'paymentMethod')
        self.payment_method = attributes[:'paymentMethod']
      end

      if attributes.has_key?(:'paymentMethodBrand')
        self.payment_method_brand = attributes[:'paymentMethodBrand']
      end

      if attributes.has_key?(:'primaryRiskTaker')
        self.primary_risk_taker = attributes[:'primaryRiskTaker']
      end

      if attributes.has_key?(:'processor')
        self.processor = attributes[:'processor']
      end

      if attributes.has_key?(:'supportedCurrencies')
        if (value = attributes[:'supportedCurrencies']).is_a?(Array)
          self.supported_currencies = value
        end
      end

      if attributes.has_key?(:'supportedCustomersPresences')
        if (value = attributes[:'supportedCustomersPresences']).is_a?(Array)
          self.supported_customers_presences = value
        end
      end

      if attributes.has_key?(:'supportedFeatures')
        if (value = attributes[:'supportedFeatures']).is_a?(Array)
          self.supported_features = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          data_collection_type == o.data_collection_type &&
          deprecated == o.deprecated &&
          deprecation_reason == o.deprecation_reason &&
          description == o.description &&
          feature == o.feature &&
          id == o.id &&
          name == o.name &&
          payment_method == o.payment_method &&
          payment_method_brand == o.payment_method_brand &&
          primary_risk_taker == o.primary_risk_taker &&
          processor == o.processor &&
          supported_currencies == o.supported_currencies &&
          supported_customers_presences == o.supported_customers_presences &&
          supported_features == o.supported_features
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [data_collection_type, deprecated, deprecation_reason, description, feature, id, name, payment_method, payment_method_brand, primary_risk_taker, processor, supported_currencies, supported_customers_presences, supported_features].hash
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
