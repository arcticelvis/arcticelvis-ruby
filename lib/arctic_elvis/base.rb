module ArcticElvis
  class Base
    
    attr_accessor :created_at, :updated_at

    # Initializes the object using the given attributes
    #
    # @param [Hash] attributes The attributes to use for initialization
    def initialize(attributes = {})
      set_attributes(attributes)
      parse_timestamps
    end

    # Sets the attributes
    #
    # @param [Hash] attributes The attributes to initialize
    def set_attributes(attributes)
      attributes.each_pair do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    # Parses UNIX timestamps and creates Time objects.
    def parse_timestamps
      @created_at = DateTime.parse(created_at) if created_at
      @updated_at = DateTime.parse(updated_at) if updated_at
    end
  end
end