require 'spec_helper'

describe RailsSort::QueryString do

  describe ".sort" do
    it "can be called on the class directly" do
      sort_scope       = User.sort({sort_direction: "asc", sort_attribute: :email})
      equivalent_scope = User.order(email: :asc)

      expect(sort_scope).to eq(equivalent_scope)
    end

    it "can be called on existing scopes" do
      initial_scope    = User.where(email: "email")
      sort_scope       = initial_scope.sort({sort_direction: "asc", sort_attribute: :email})
      equivalent_scope = initial_scope.order(email: :asc)

      expect(sort_scope).to eq(equivalent_scope)
    end
  end

end
