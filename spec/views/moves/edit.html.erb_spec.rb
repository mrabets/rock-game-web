require 'rails_helper'

RSpec.describe "moves/edit", type: :view do
  before(:each) do
    @move = assign(:move, Move.create!(
      content: "MyText",
      user: nil,
      room: nil
    ))
  end

  it "renders the edit move form" do
    render

    assert_select "form[action=?][method=?]", move_path(@move), "post" do

      assert_select "textarea[name=?]", "move[content]"

      assert_select "input[name=?]", "move[user_id]"

      assert_select "input[name=?]", "move[room_id]"
    end
  end
end
