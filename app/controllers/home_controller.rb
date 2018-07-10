class HomeController < ApplicationController
  require 'securerandom'
  def index
    if logged_in?
      @client = getClient(current_user)
      @tweets_data = []
      @favorite_total = 0
      if @client
        @match_data = /名古屋オーシャンズ|フットサル/
        @client.user_timeline(count: 3000, tweet_mode: "extended" ).each do |tweet|
          tweet_data = {
              text: tweet.attrs[:full_text],
              favorite_count: tweet.favorite_count,
              retweet_count: tweet.retweet_count,
              reply?: tweet.reply?,
              retweet?: tweet.retweet?,
              find_word?: !tweet.attrs[:full_text].scan(@match_data).empty?
          }
          puts "find word #{tweet.attrs[:full_text].scan(@match_data)}"
          if tweet_data[:retweet?] == false && tweet_data[:find_word?] == true
            @favorite_total += tweet_data[:favorite_count]
          end

          @tweets_data << tweet_data
        end
        @coupon_text = "スタジアム観戦無料"
        @url_code = "https://sns-good-coupon.herokuapp.com/coupon-auth?id=#{0}&p=#{SecureRandom.base58}"
      end
    end
  end
end
