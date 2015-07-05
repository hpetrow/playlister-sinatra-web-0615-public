class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def add_artist_by_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
