module ApplicationHelper
		def gravatar_for(user, options = { size: 80})

		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

		size = options[:size]

		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

		image_tag(gravatar_url, alt: user.username, class: "img-circle")
		end

		def Total_price(obj)
			sum = 0
			obj.each do |obj|
				sum += obj.quantity_order * obj.order_item_price
			end
			
			sum
			
		end

end
