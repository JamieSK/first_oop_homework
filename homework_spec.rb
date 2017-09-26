require 'minitest/autorun'
require 'minitest/rg'
require_relative 'homework'

class TestStudent < MiniTest::Test
  def setup
    @student = Student.new('Jamie', 3)
  end

  def test_get_name
    assert_equal('Jamie', @student.name)
  end

  def test_get_cohort
    assert_equal(3, @student.cohort)
  end

  def test_set_name
    @student.name = 'Jim'
    assert_equal('Jim', @student.name)
  end

  def test_set_cohort
    @student.cohort = -4
    assert_equal(-4, @student.cohort)
  end

  def test_talk
    assert_equal('I can talk!', @student.talk)
  end

  def test_say_fav_language
    assert_equal('I love Ruby', @student.say_favourite_language('Ruby'))
  end
end

class TestSportsTeam < MiniTest::Test
  def setup
    @sports_team = SportsTeam.new(
      'Glasgow Warriors',
      ['Prop', 'Hooker', 'Prop', 'The rest'],
      'Dave Rennie'
    )
  end

  def test_get_team_name
    assert_equal('Glasgow Warriors', @sports_team.name)
  end

  def test_get_players
    assert_equal(['Prop', 'Hooker', 'Prop', 'The rest'], @sports_team.players)
  end

  def test_get_coach
    assert_equal('Dave Rennie', @sports_team.coach)
  end

  def test_set_coach
    @sports_team.coach = 'Neil Lennon'
    assert_equal('Neil Lennon', @sports_team.coach)
  end

  def test_push_new_player
    @sports_team.add_player!('LeBron James')
    assert(@sports_team.players.include?('LeBron James'))
  end

  def test_is_player__true
    assert(@sports_team.player?('Hooker'))
  end

  def test_is_player__false
    refute(@sports_team.player?('Batsman'))
  end

  def test_update_points__win
    @sports_team.update_points!('win')
    assert_equal(3, @sports_team.points)
  end

  def test_update_points__lose
    @sports_team.update_points!('lose')
    assert_equal(0, @sports_team.points)
  end
end

class TestLibrary < MiniTest::Test
  def setup
    @library = Library.new
  end

  def test_list_all_books
    result = [
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
    assert_equal(result, @library.list_all_books)
  end

  def test_list_one_book
    result = {
      title: 'consider_phlebas',
      rental_details: {
        student_name: 'Jamie',
        date: '23/09/2018'
      }
    }
    assert_equal(result, @library.list('consider_phlebas'))
  end

  def test_rental_details
    result = {
      student_name: 'Jamie',
      date: '23/09/2018'
    }
    assert_equal(result, @library.rental_details('consider_phlebas'))
  end

  def test_add_book
    @library.add_book!('the_dictionary')
    result = {
      title: 'the_dictionary',
      rental_details: {
        student_name: '',
        date: ''
      }
    }
    assert_equal(result, @library.list('the_dictionary'))
  end

  def test_change_renter
    @library.change_renter!('lord_of_the_rings', 'Jamie', '23/09/2018')
    actual = @library.list('lord_of_the_rings')
    expected = {
      title: 'lord_of_the_rings',
      rental_details: {
        student_name: 'Jamie',
        date: '23/09/2018'
      }
    }
    assert_equal(actual, expected)
  end
end
