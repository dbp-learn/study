module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film['name'], film['rating_kinopoisk'], film['rating_imdb'],
      # film['genres'], film['year'], film['access_level'], film['country']
      def rating(films)
        selected_films = films.select { |film| film['rating_kinopoisk'].to_i.positive? && film['country'].to_s.split(',').size > 1 }
        selected_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / selected_films.size
      end

      def chars_count(films, threshold)
        selected_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        selected_films.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
