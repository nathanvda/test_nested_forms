require 'spec_helper'

describe "projects/show.html.haml" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
