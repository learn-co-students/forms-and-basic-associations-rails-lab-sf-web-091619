class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents
    song_arr = []
    self.notes.each do |n|
      song_arr << n.content unless n.content.empty?
    end
    song_arr
  end

  def note_contents=(content)
    content.each do |c|
      self.notes << Note.find_or_create_by(content: c)
    end
  end



end