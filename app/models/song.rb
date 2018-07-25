require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(content)
    content.each do |c|
      if c.empty? == false
    self.notes << Note.find_or_create_by(content: c)
      end
    end
  end

  def note_contents
    arr = []
    self.notes.each do |n|
      arr << n.content
    end
      arr
  end

end
