class Order < ApplicationRecord

	belongs_to :end_user
	has_many :order_details, dependent: :destroy

	enum payment_method: {  credit_card: 0, 
							bank: 1
						}
	enum order_status: {  	wait_payment: 0,
	 						confirm_payment: 1,
	 						now_making: 2,
	 						prepare_shipment: 3,
	 						done_shipment: 4
	 					}

end
