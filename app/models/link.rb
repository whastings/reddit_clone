# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  url         :string(1024)     not null
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Link < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true

  belongs_to :user
  has_many   :sub_memberships
  has_many   :subs, through: :sub_memberships
end
