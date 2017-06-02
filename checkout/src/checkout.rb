class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    total = 0
    @items.uniq.each do |item|
      pricing_rule = @pricing_rules[item]
      item_count = @items.count(item)
      special_pricing = pricing_rule[:special]

      if special_pricing && item_count >= special_pricing[:count]
        while item_count >= special_pricing[:count]
          total += special_pricing[:bulk_price]
          item_count -= special_pricing[:count]
        end
      end
      total += (item_count * pricing_rule[:unit_price])
    end
    total
  end
end
