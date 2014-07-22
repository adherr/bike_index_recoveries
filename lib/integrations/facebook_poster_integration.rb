class FacebookPosterIntegration
  def initialize(bike)
    @bike = bike
  end

  def create_post
    fb = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
    fb.put_connections('me', 'feed', message: @bike.recovery_story, picture: @bike.photo, link: @bike.bi_url)
  end
end
