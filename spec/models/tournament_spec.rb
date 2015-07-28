require 'rails_helper'

RSpec.describe Tournament, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  it "returns top_five_players" do
    expect(Tournament.top_five_player).to eq(["Ashvini", "Mohit", "Abhijeet", "Devendra", "Akshay"])
  end
  
end
