module TopMovies
class Movies
  attr_accessor :title, :date

  @@all = [ ]


def initialize(movie_hash)
  movie_hash.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.create_from_collection(movie_hash)
      movie_hash.each do |movie|
        movie = self.new(movie)
      end
end

def self.make_movies
    movie_hash = Scraper.scrape_index_page
    self.create_from_collection(movie_hash)
end

# def titleize
#     split(/(\W)/).map(&:capitalize).join
# end

def self.movie_included(movie)
  if self.all.include?(movie) #got rid of titleize
    puts "Congrats! Your favorite movie is a fan favorite!"
  else
    puts "Sorry! You chose an unpopular movie."
  end
end


def self.list_movies
  Movies.all.each_with_index do |movie, index|
    puts "#{index + 1}.) #{movie.title}"
  end
end


def self.show_movie_number(number)
  list_movies[number - 1]
end

def self.show_movie_date(movie)
  #if all includes that movie then put date of original movie
  self.all.each do |film|
    #binding.pry
    if film.title == movie
      puts film.date #for some reason showing up four times
    else
      puts "That film is not in the top 250."
    end
  end

end



def self.all
  @@all
end

end
end
