Spree::Order.class_eval do

  # all products are unshippable
  def unshippable?
    line_items.all? { |item| item.unshippable? }
  end

  def some_unshippable?
    line_items.any? { |item| item.unshippable? }
  end

  def unshippable_line_items
    line_items.select(&:unshippable?)
  end

  # all products are digital
  def digital?
    line_items.all? { |item| item.digital? }
  end
  
  def some_digital?
    line_items.any? { |item| item.digital? }
  end

  def digital_line_items
    line_items.select(&:digital?)
  end

  def digital_links
    digital_line_items.map(&:digital_links).flatten
  end

  def reset_digital_links!
    digital_links.each do |digital_link|
      digital_link.reset!
    end
  end

end
