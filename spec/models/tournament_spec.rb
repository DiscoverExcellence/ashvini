require 'rails_helper'

RSpec.describe Tournament, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    Game.create(name: "Cricket",description:"Indian Premier League",played_on: 23/4/15)
    Tournament.create(name:"IPL",game_id: Game.where(name: "Cricket").first.id)
    Player.create(name: "Ashvini")
    Player.create(name: "sakshi")
    Match.create(no_of_player: 2,game_id: Game.where(name: "Cricket").first.id)
    Score.create(player_id: Player.first.id, match_id: Match.first.id,points: 10,tournament_id: Tournament.first.id)
    Score.create(player_id: Player.last.id, match_id: Match.first.id,points: 0,tournament_id: Tournament.first.id)
    @t = Tournament.first
  end
  it "returns hello" do
    t = Tournament.create(name: "Ipl")
    expect(t.hello).to eq("Hello")
  end
   # expect()
  it "returns winner of the tournament" do
    expect(@t.winner).to eq("Ashvini")

  end

  it "returns top_five_players" do
    expect(@t.top_five_player).to eq(["Ashvini", "sakshi"])
  end

end
