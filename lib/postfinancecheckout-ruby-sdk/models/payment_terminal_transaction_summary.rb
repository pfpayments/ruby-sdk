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
  class PaymentTerminalTransactionSummary
    # 
    attr_accessor :dcc_transaction_sums

    # 
    attr_accessor :ended_on

    # A unique identifier for the object.
    attr_accessor :id

    # The ID of the space this object belongs to.
    attr_accessor :linked_space_id

    # 
    attr_accessor :number_of_transactions

    # 
    attr_accessor :payment_terminal

    # 
    attr_accessor :receipt

    # 
    attr_accessor :started_on

    # 
    attr_accessor :transaction_sums

    # The version is used for optimistic locking and incremented whenever the object is updated.
    attr_accessor :version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'dcc_transaction_sums' => :'dccTransactionSums',
        :'ended_on' => :'endedOn',
        :'id' => :'id',
        :'linked_space_id' => :'linkedSpaceId',
        :'number_of_transactions' => :'numberOfTransactions',
        :'payment_terminal' => :'paymentTerminal',
        :'receipt' => :'receipt',
        :'started_on' => :'startedOn',
        :'transaction_sums' => :'transactionSums',
        :'version' => :'version'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'dcc_transaction_sums' => :'Array<PaymentTerminalDccTransactionSum>',
        :'ended_on' => :'DateTime',
        :'id' => :'Integer',
        :'linked_space_id' => :'Integer',
        :'number_of_transactions' => :'Integer',
        :'payment_terminal' => :'Integer',
        :'receipt' => :'String',
        :'started_on' => :'DateTime',
        :'transaction_sums' => :'Array<PaymentTerminalTransactionSum>',
        :'version' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'dccTransactionSums')
        if (value = attributes[:'dccTransactionSums']).is_a?(Array)
          self.dcc_transaction_sums = value
        end
      end

      if attributes.has_key?(:'endedOn')
        self.ended_on = attributes[:'endedOn']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'linkedSpaceId')
        self.linked_space_id = attributes[:'linkedSpaceId']
      end

      if attributes.has_key?(:'numberOfTransactions')
        self.number_of_transactions = attributes[:'numberOfTransactions']
      end

      if attributes.has_key?(:'paymentTerminal')
        self.payment_terminal = attributes[:'paymentTerminal']
      end

      if attributes.has_key?(:'receipt')
        self.receipt = attributes[:'receipt']
      end

      if attributes.has_key?(:'startedOn')
        self.started_on = attributes[:'startedOn']
      end

      if attributes.has_key?(:'transactionSums')
        if (value = attributes[:'transactionSums']).is_a?(Array)
          self.transaction_sums = value
        end
      end

      if attributes.has_key?(:'version')
        self.version = attributes[:'version']
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
          dcc_transaction_sums == o.dcc_transaction_sums &&
          ended_on == o.ended_on &&
          id == o.id &&
          linked_space_id == o.linked_space_id &&
          number_of_transactions == o.number_of_transactions &&
          payment_terminal == o.payment_terminal &&
          receipt == o.receipt &&
          started_on == o.started_on &&
          transaction_sums == o.transaction_sums &&
          version == o.version
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [dcc_transaction_sums, ended_on, id, linked_space_id, number_of_transactions, payment_terminal, receipt, started_on, transaction_sums, version].hash
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
