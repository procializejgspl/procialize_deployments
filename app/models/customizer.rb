class Customizer < ActiveRecord::Base
  attr_accessible :menu_color_one, :menu_color_two, :twitter_handle ,:menu_font_color,:menu_font_size,:menu_header_color,:ga,:ga_tracker_id,:contact_us_body,:event_logo,:mail_subject
  has_attached_file :event_logo , :default_url => "/assets/user_dummy.jpg"
  def self.gettweets
    @handle= Customizer.first.twitter_handle
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "k338JAEntAeF33lFkOIQ"
      config.consumer_secret = "U3hszX1mxfhjPFSoZ2nixF8nJFCFCPqFcpSS10Ec"
      config.access_token = "163893865-ONQsIvGHLQlpAOQRIYzFy4Lnix5oY3NZwGEso5Xw"
      config.access_token_secret = "tXZwUmcysNh19KwqkdgSZ9WojtzNEUoDZzadq2YCPH4"
    end
    @tweets = client.search(@handle, :lang => "en", :count => 15, :result_type => "recent").collect do |status|

      {pic:status.user.profile_image_url ,screen_name:status.user.screen_name,tweet:status.text}

      #"#{status.user.screen_name}: #{status.text}"
    end


    # @tweets = Twitter.search("from:@LifeAtISB")

    return @tweets
  end
end
