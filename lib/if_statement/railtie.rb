require 'if_statement'
require 'rails'

module IfStatement
  class Railtie < Rails::Railtie

    # loaded on Rails initialization
    initializer "if_statement.configure_rails_initialization" do
      ActionController::Base.send :include, IfStatement::Features
      ActiveRecord::Base.send     :include, IfStatement::Features
      ActionView::Base.send       :include, IfStatement::Features
    end

    config.to_prepare do
      global_config = Rails.root.join 'config', 'features.rb'
      local_config = Rails.root.join 'config', 'features', "#{ Rails.env }.rb"

      load global_config  if File.exists? global_config
      load local_config   if File.exists? local_config
    end
  end
end
