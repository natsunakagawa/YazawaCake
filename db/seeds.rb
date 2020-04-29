# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'infratop@gmail.com', password: '111111')

EndUser.create(email: 'dazai@gmail.com', password: '111111', last_name: '太宰', 
				kana_last_name: 'ダザイ', first_name: '治', kana_first_name: 'オサム', 
				postal_code: '1234567', address: '東京都三鷹市下連雀2-14', phone_number: '1234567890')

Genre.create([{name: '小説'}, {name: '随筆'}])

Item.create([{genre_id: 1, name: '人間失格', introduction: '「恥の多い生涯を送ってきました」', 
				price: 480},
			 {genre_id: 2, name: '富嶽百景', introduction: '富士の頂角、広重ひろしげの富士は八十五度、', 
			 	price: 600}])

Addresse.create([{end_user_id: 1, name: '芥川龍之介', address: '北豊島郡滝野川町字田端４３５番地', 
					postal_code: '1234567'},
				 {end_user_id: 1, name: '川端康成', address: '上中条二丁目11-25', 
				 	postal_code: '9876543'}])