require 'spec_helper'

describe "tasks/edit.html.haml" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :new_record? => false,
      :name => "MyString",
      :description => "MyString",
      :status => "MyString",
      :done => false,
      :project_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => task_path(@task), :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_description", :name => "task[description]"
      assert_select "input#task_status", :name => "task[status]"
      assert_select "input#task_done", :name => "task[done]"
      assert_select "input#task_project_id", :name => "task[project_id]"
    end
  end
end
