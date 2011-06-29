module IfStatement
  module Features
    # executes &block if feature identifier is enabled
    def feature identifier, &block
      yield if feature? identifier
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
