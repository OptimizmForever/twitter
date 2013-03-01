module TweetsHelper
  def tweets_table(tweets)
    content_tag :ul do
      content_tag_for :li, tweets do |tweet|
        raw tweet.text + "&nbsp;" + tweet.created_at.to_s + "&nbsp;" + link_to( "Edit",edit_tweet_path(tweet))
      end
    end
  end
end
