# modele ApplicationHelper
module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

    size = options[:size]

    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def total_price(object)
    sum = 0
    object.each do |obj|
      sum += obj.quantity_order * obj.order_item_price
    end
    sum
  end
end
