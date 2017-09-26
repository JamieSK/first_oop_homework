class Student
  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def name
    @name
  end

  def cohort
    @cohort
  end

  def name=(new_name)
    @name = new_name
  end

  def cohort=(new_cohort)
    @cohort = new_cohort
  end

  def talk
    'I can talk!'
  end

  def say_favourite_language(language)
    "I love #{language}"
  end
end

class SportsTeam
  def initialize(name, players, coach)
    @name = name
    @players = players
    @coach = coach
    @points = 0
  end

  def name
    @name
  end

  def players
    @players
  end

  def coach
    @coach
  end

  def points
    @points
  end

  def coach=(new_coach)
    @coach = new_coach
  end

  def add_player!(new_player)
    @players << new_player
  end

  def player?(player)
    @players.include?(player)
  end

  def update_points!(result)
    @points += 3 if result == 'win'
  end
end

class Library
  def initialize
    @books = [
      {
        title: 'lord_of_the_rings',
        rental_details: {
          student_name: 'Jeff',
          date: '01/12/16'
        }
      },
      {
        title: 'consider_phlebas',
        rental_details: {
          student_name: 'Jamie',
          date: '23/09/2018'
        }
      },
      {
        title: 'meditations',
        rental_details: {
          student_name: 'Jeff',
          date: '01/12/16'
        }
      }
    ]
  end

  def list_all_books
    @books
  end

  def list(title)
    @books.each do |book|
      return book if book[:title] == title
    end
    nil
  end

  def rental_details(title)
    list(title)[:rental_details] unless list(title).nil?
  end

  def add_book!(title)
    @books << {
      title: title,
      rental_details: {
        student_name: '',
        date: ''
      }
    }
  end

  def change_renter!(title, renter, date)
    book = list(title)
    return nil if book.nil?

    book[:rental_details][:student_name] = renter
    book[:rental_details][:date] = date
  end
end
