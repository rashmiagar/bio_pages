require 'rails_helper'

RSpec.describe "home/landing", :type => :view do
  it "should display correct heading on page if no user is logged in" do
    render
    expect(rendered).to include("Cyborg Skills Profile")
  end
end

