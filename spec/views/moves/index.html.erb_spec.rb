require 'rails_helper'

RSpec.describe "moves/index", type: :view do
  before(:each) do
    assign(:moves, [
      Move.create!(
        content: "MyText",
        user: nil,
        room: nil
      ),
      Move.create!(
        content: "MyText",
        user: nil,
        room: nil
      )
    ])
  end

  it "renders a list of moves" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
