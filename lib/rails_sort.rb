class RailsSort


  # Apply an order to the given ActiveRecord::Relation based on the provided params
  #
  # @param scope [ActiveRecord::Relation] An User::ActiveRecord_Relation (EG: User.all)
  # @param params [Hash] A hash containing the sorting parameters
  # @param default_sort_options [Hash] A hash containing default ordering options
  #   These should be the same as would be passed directly to Model.order.
  #   Example: {name: :desc}
  #
  # @return [ActiveRecord::Relation] The scope that was passed in with the sort applied as
  #   an order.
  def self.sort(scope, params, default_sort_options=nil)
    sort_attribute = params[:sort_attribute]
    sort_direction = params[:sort_direction]

    if sort_attribute.present? && sort_direction.present?
      sort_scope(scope, sort_attribute, sort_direction)
    else
      scope = scope.order(default_sort_options) if default_sort_options.present?
      scope
    end
  end

private

  def self.sort_scope(scope, attribute, direction)
    case direction
    when "asc", "desc"
      scope.order(attribute => direction)
    else
      raise(ArgumentError, "Unknown sort direction provided: #{direction}")
    end
  end

end

require_relative 'rails_sort/active_record_patch'
require_relative 'rails_sort/query_string'
require_relative 'rails_sort/uri_constructor'
require_relative 'rails_sort/view_helper'

if defined?(Rails)
  ActionView::Base.include RailsSort::ViewHelper
  ActiveRecord::Base.include RailsSort::ActiveRecordPatch
end
