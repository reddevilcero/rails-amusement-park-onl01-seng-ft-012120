class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
     if !check_tickets_and_hight
      update_user
     else
      check_tickets_and_hight
     end
  end

    private

    def update_user
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
      nil
    end

    def check_tickets_and_hight
      if check_hight && check_tickets
        return "Sorry. #{check_tickets} #{check_hight}"
      elsif check_hight || check_tickets
        return "Sorry. #{check_tickets || check_hight}"
      else
        nil
      end
    end

    def check_tickets
       "You do not have enough tickets to ride the #{attraction.name}." if self.user.tickets < self.attraction.tickets
    end

    def check_hight
      "You are not tall enough to ride the #{attraction.name}." if self.user.height < self.attraction.min_height
    end

end
