require 'if_statement/features'

module IfStatement
  class << self
    # set up a bunch of features
    #
    # usage
    #    IfStatement.setup do
    #       set :messaging, true
    #       set(:admin) { current_user.admin? }
    #    end
    def setup &block
      def set identifier, value=nil, &block
        define identifier, value, &block
      end

      class_eval(&block)
    end

    # define a specific feature
    #   give a boolean value, or a block
    def define identifier, value=nil, &block
      identifier = identifier.to_sym
      if block
        features[identifier] = block
      else
        features[identifier] = !!value
      end
    end

    # reads the current value of identifier
    def read identifier
      value = features[identifier]
      value.nil? ? false : value
    end

    def features
      @features ||= {}
    end
  end
end
