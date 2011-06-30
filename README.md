# IfStatement

> a colossally stupid Rails feature flipper plugin

IfStatement executes code based on whether it meets some condition. A condition evaluates to false by default. The evaluation can be done in models, controllers, helpers, or anywhere that includes `IfStatement::Features`.

## Why

Because none of the existing ones worked exactly like I wanted. Also, I hadn't written a Rails plugin before.

## Usage

in a view

``` erb
<%= feature :nuts do %>
<ul>
    <li>Almonds</li>
    <li>Walnuts</li>
    <li>Hazelnuts</li>
</ul>
<% end %>
```

everywhere else

``` ruby
feature :nuke do
    kill_everyone!
end
```

## Installation

In a Rails 3 project, add this to your `Gemfile`:

``` ruby
gem 'if_statement'
```

and then run `bundle install`

## Setting what these thing evalute to

Global settings should be in `config/features.rb`:

``` ruby
IfStatement.setup do
    set(:nuts) { current_person.has_no :allergies }
    set :wipe_db, false
end
```

Environment specific settings can be in `config/features/environment.rb`:

``` ruby
# config/features/development.rb
IfStatement.setup do
    set(:nuts) { current_person.has_no :allergies }
    set :wipe_db, true
end
```

## Probably better bets

* [Rollout](https://github.com/jamesgolick/rollout)
* [Dolphin](https://github.com/grillpanda/dolphin)
* [Feature Flipper](https://github.com/qype/feature_flipper)

Copyright (c) 2011 Andrew Lunny, released under the MIT license
