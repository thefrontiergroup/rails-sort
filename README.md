# Rails Sortify

This gem provides some view helpers and a model for performing basic sorts on ActiveRecord models.

This is just for consistency - so a consistent set of parameters are used for sorting. There's also a bunch of sorcery done so that the sort will remember search parameters and not clobber anything.

## Usage

Include a reference in your Gemfile:

```ruby
gem 'rails-sortify', github: "thefrontiergroup/rails-sortify"
```

In your view you can create a sortable heading that will provide a link to toggle the sorting options. Sorting is in the following recurring order:

    1. None
    2. Asc
    3. Desc

The link that is returned will have a class attached to it indicating direction (none, "asc", or "desc"). You can use this to style the link appropriately (EG: up/down arrows)

If you were on the index action for Users and you wanted to sort by email:

```haml
%table
  %thead
    %th= sortable_heading_for(:email, "Email")
```

Which will generate the following link:

```html
<a href="http://localhost:3000?sort_attribute=email&sort_direction=asc">Email</a>
```

Clicking that link will pass the sort parameters through to your index action.

You can use the RailsSortify model to sort your collection. EG:

```ruby
def index
  @users = User.all
  @users = RailSortify.sort(@users, params)
end
```

You can pass through some default sort options that will be used if no sorting has been indicated by the user.

```ruby
def index
  @users = User.all
  @users = RailSortify.sort(@users, params, {name: :asc})
end
```
