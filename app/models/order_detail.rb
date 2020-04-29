class OrderDetail < ApplicationRecord

	belongs_to :item
	belongs_to :order

	enum make_status: { cannot_start: 0,
						wait_making: 1,
						now_making: 2,
						complete_making: 3
					}
end
