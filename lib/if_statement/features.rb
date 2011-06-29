module IfStatement
  module Features
    # executes &block if feature identifier is enabled
    def feature identifier, &block
      if feature? identifier
        if respond_to? :with_output_buffer
          with_output_buffer &block
        else
          yield
        end
      end
      #"OH HAI"
      #yield if feature? identifier
    end

    # checks whether identifier is enabled in current env
    def feature? identifier
      value = IfStatement.read identifier
      if value.respond_to? :call
        !!instance_eval(&value)
      else
        value
      end
    end
  end
end
