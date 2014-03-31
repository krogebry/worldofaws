##
# This is a game.

GameSecStore = Mongo::MongoClient.new()["game_sec"]
namespace "/api/1.0/game" do
  get "/status" do
    pp params
    res = GameSecStore.collection( "security_groups" ).find({ owner: params["user"] }).first
    pp res
    { success:  true, data: res }.to_json
  end
end
