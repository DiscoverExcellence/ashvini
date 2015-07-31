class MatchesController < ApplicationController
def index
  @match = Match.all
end
end
