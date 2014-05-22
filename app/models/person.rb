class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :comapny_name, :email
  has_many :notes

  
	def self.merge(winner, loser)
  	winner.email << loser.email if winner.email.empty?  
    winner.notes << loser.notes
    loser.destroy
    winner
  end

  def duplicates?(person)
    return false if person == nil
		person_attrs = person.first_name, person.last_name, person.email
		self_attrs = self.first_name, self.last_name, self.email
		person_attrs == self_attrs    
  end

end