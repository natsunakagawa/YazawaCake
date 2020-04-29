class Addresse < ApplicationRecord

	belongs_to :end_user


	def address_information
		self.postal_code + " " + self.address + " " + self.name
	end

end
