class RailsSort
  module ActiveRecordPatch
    extend ActiveSupport::Concern

    module ClassMethods
      def sort(parameters, default_sort_options=nil)
        RailsSort.sort(self, parameters, default_sort_options)
      end
    end
  end
end