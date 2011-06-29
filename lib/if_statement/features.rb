module IfStatement
  module Features
    # executes &block if feature identifier is enabled
    def feature identifier, &block
    end

    # checks whether identifier is enabled in current env
    def feature? identifier
    end
  end
end
