# IfStatement

> a colossally stupid Rails feature flipper plugin

IfStatement executes code based on whether it meets some condition. A condition evaluates to false by default. The evaluation can be done in models, controllers, helpers, or anywhere that includes `IfStatement::Features`.

## Why

Because none of the existing ones worked exactly like I wanted. Also, I hadn't written a Rails plugin before.

## Usage

in a view

    <%= feature :nuts do %>
    <ul>
        <li>Almonds</li>
        <li>Walnuts</li>
        <li>Hazelnuts</li>
    </ul>
    <% end %>

everywhere else

    feature :nuke do
        kill_everyone!
    end

## Probably better bets

* [Rollout](https://github.com/jamesgolick/rollout)
* [Dolphin](https://github.com/grillpanda/dolphin)
* [Feature Flipper](https://github.com/qype/feature_flipper)

Copyright (c) 2011 Andrew Lunny, released under the MIT license
