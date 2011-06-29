# import the IfStatement methods into the core Rails classes
ActionController::Base.send :include, IfStatement::Features

ActiveRecord::Base.send :include, IfStatement::Features

ActionView::Base.send :include, IfStatement::Features
