require'spec_helper'
describe Tournament do

  it "should return winner name as Ashvini" do
    Tournament.winner.should == 'Ashvini'
   end
end
