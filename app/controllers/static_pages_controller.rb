class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def self.get_newest_list_review
    list_data = []
    length_list = 0
    Review.all.reverse.each do |review|
      if review.created_at - 20.day.ago > 0
        list_data.push(review)
        length_list += 1
      end
      if length_list == 10
        return list_data
      end
    end
    list_data
  end
# get 10 newest place
  def self.get_list_registration
    list_data = []
    length_list = 0
    Place.all.reverse.each do |place|
      if place.created_at - 3.day.ago > 0
        list_data.push(place)
        length_list += 1
      end
      if length_list == 5
        return list_data
      end
    end
    list_data
  end

  def self.get_top (array_ag, result_length)
    result_data = []
    if array_ag.length >= (5 - result_length)
      (result_length..4).each { |i|
        result_data.push(array_ag[i - result_length])
      }
      result_data
    else
      array_ag
    end
  end

#get top10 rating
  def self.get_list_rating
    list_data = {list1: [], list2: [], list3: [], list4: [], list5: []}
    result_data = []
    Place.all.each do |place|
      x = place.mediumRating
      if (0 <= x) && (x < 1)
        list_data[:list5].push(place)
      elsif (1 <= x) && (x < 2)
        list_data[:list4].push(place)
      elsif (2 <= x) && (x < 3)
        list_data[:list3].push(place)
      elsif (3 <= x) && (x < 4)
        list_data[:list2].push(place)
      elsif (4 <= x) && (x <= 5)
        list_data[:list1].push(place)
      end
    end
    list_data.each do |key, value|
      if result_data.length == 5
         return result_data
      else
        (value.sort_by! { |data| data.mediumRating }).reverse!
        result_data.concat get_top(value, result_data.length)
      end
    end
    result_data
  end


end
