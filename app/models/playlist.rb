# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  name       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Playlist < ApplicationRecord
  has_and_belongs_to_many :songs
  belongs_to :user
end
