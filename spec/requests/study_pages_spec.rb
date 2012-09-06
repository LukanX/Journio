require 'spec_helper'

describe "Study pages" do
	subject { page }

	describe "create" do
		before { visit createstudy_path }
		let(:submit) { "Create study" }

		describe "with invalid information" do
			it "should not create a sudy" do
				expect { click_button submit }.not_to_change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example Study"
				fill_in "Description", with: "An example study"
			end
		end
	end
end
