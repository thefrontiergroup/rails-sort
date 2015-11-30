class RailsSort
  module ActiveRecordPatch
    extend ActiveSupport::Concern

    module ClassMethods
      def sort(parameters, default_sort_options=nil)
        RailsSort.sort(all, parameters, default_sort_options)
      end
    end
  end
end
