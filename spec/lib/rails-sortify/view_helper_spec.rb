require 'spec_helper'

describe RailsSortify::ViewHelper do

  class FakeHelper
    include ActionView::Helpers::UrlHelper
    include RailsSortify::ViewHelper
  end

  describe "#sortable_heading_for" do
    subject { helper.sortable_heading_for(attribute, name) }
    let(:helper) { FakeHelper.new }
    let(:attribute) { "dongle" }
    let(:name) { "Dingle" }

    before do
      stub_request = instance_double(ActionDispatch::Request)
      allow(stub_request).to receive(:path).and_return("x")
      allow(stub_request).to receive(:query_parameters).and_return(query_parameters)
      allow(helper).to receive(:request).and_return(stub_request)
    end

    context "when query parameters exist for given attribute" do
      let(:query_parameters) { {sort_attribute: attribute, sort_direction: "asc"} }

      it "returns a link with the sortable URL" do
        expected_uri = "www.jordan_rules.com"
        expect_any_instance_of(RailsSortify::UriConstructor).to receive(:build_uri_with_cycled_sorting_params).and_return(expected_uri)

        should include("href=\"#{expected_uri}\"")
      end

      context "when link name is not provided" do
        let(:name) { nil }
        it "includes the titleized attribute" do
          should include(">Dongle</a>")
        end
      end

      context "when link name is provided" do
        let(:name) { "Dingle" }
        it "includes the customised link name" do
          should include(">Dingle</a>")
        end
      end

      it "includes the sort direction as a class" do
        should include("sortable asc")
      end
    end

    context "when query parameters exist for other attribute" do
      let(:query_parameters) { {sort_attribute: "other_attribute", sort_direction: "asc"} }

      it "returns a link with the sortable URL" do
        expected_uri = "www.jordan_rules.com"
        expect_any_instance_of(RailsSortify::UriConstructor).to receive(:build_uri_with_cycled_sorting_params).and_return(expected_uri)

        should include("href=\"#{expected_uri}\"")
      end

      context "when link name is not provided" do
        let(:name) { nil }
        it "includes the titleized attribute" do
          should include(">Dongle</a>")
        end
      end

      context "when link name is provided" do
        let(:name) { "Dingle" }
        it "includes the customised link name" do
          should include(">Dingle</a>")
        end
      end

      it "includes the sort direction as a class" do
        should include("sortable")
        should_not include("sortable asc")
      end
    end
  end

end
