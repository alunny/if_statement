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

## Setting what these thing evalute to

The best place for now would be `config/initializers/if_statement.rb`:

``` ruby
IfStatement.setup do
    set(:nuts) { current_person.has_no :allergies }
    set :nuke, Rails.env.production?
end
```

## Probably better bets

* [Rollout](https://github.com/jamesgolick/rollout)
* [Dolphin](https://github.com/grillpanda/dolphin)
* [Feature Flipper](https://github.com/qype/feature_flipper)

Copyright (c) 2011 Andrew Lunny, released under the MIT license
