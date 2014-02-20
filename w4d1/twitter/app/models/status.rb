class Status < ActiveRecord::Base
  validate :body, :twitter_status_id, :twitter_user_id, :presence => true

  def self.fetch_by_user_id!(twitter_user_id)
    parse_json(TwitterSession.get("statuses/user_timeline", { "user_id" => twitter_user_id } ))
  end

  def self.parse_json(json)
    parsed = json.parse(json)
    body, twitter_status_id, twitter_user_id = []
    parsed.each do |status|
      body << status["text"]
      twitter_status_id << status["id_str"]
      twitter_user_id << status["user"]["id_str"]
    end
  end




end
