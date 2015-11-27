require 'bundler'
Bundler.require
require 'rails/all'

# Dir.glob("./lib/rails-sort/**/*.rb", &method(:require))
require './lib/rails_sort'
Dir.glob("./lib/support/**/*.rb", &method(:require))

RSpec.configure do |config|
  config.mock_with :rspec
end

# Create an in-memory database to do some basic tests with a real model
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :email
  end

end