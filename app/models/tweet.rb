# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  attr_accessible :text
  belongs_to :user
  validates :text, :presence => true, :length => {:maximum => 20}, :on => :create
  #scope :content_text, lambda {|s| where("text like ?","%#{s}%")}
  def self.contents_text(s)
    where("text like ?","%#{s}%")
  end

end
