require 'rails_helper'

RSpec.describe "moves/new", type: :view do
  before(:each) do
    assign(:move, Move.new(
      content: "MyText",
      user: nil,
      room: nil
    ))
  end

  it "renders new move form" do
    render

    assert_select "form[action=?][method=?]", moves_path, "post" do

      assert_select "textarea[name=?]", "move[content]"

      assert_select "input[name=?]", "move[user_id]"

      assert_select "input[name=?]", "move[room_id]"
    end
  end
end
