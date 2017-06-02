require 'checkout'

describe Checkout do
  RULES = {
    'A' => { unit_price: 50, special: { count: 3, bulk_price: 130 }},
    'B' => { unit_price: 30, special: { count: 2, bulk_price:  45 }},
    'C' => { unit_price: 20 },
    'D' => { unit_price: 15 },
  }

  it 'calculates totals correctly' do
    expect(price_of('')).to eq 0
    expect(price_of('A')).to eq 50
    expect(price_of('AB')).to eq 80
    expect(price_of('CDBA')).to eq 115

    expect(price_of('AA')).to eq 100
    expect(price_of('AAA')).to eq 130
    expect(price_of('AAAA')).to eq 180
    expect(price_of('AAAAA')).to eq 230
    expect(price_of('AAAAAA')).to eq 260

    expect(price_of('AAAB')).to eq 160
    expect(price_of('AAABB')).to eq 175
    expect(price_of('AAABBD')).to eq 190
    expect(price_of('DABABA')).to eq 190
  end

  it 'calculates incremental totals correctly' do
    checkout = Checkout.new(RULES)
    expect(checkout.total).to eq 0
    checkout.scan('A'); expect(checkout.total).to eq 50
    checkout.scan('B'); expect(checkout.total).to eq 80
    checkout.scan('A'); expect(checkout.total).to eq 130
    checkout.scan('A'); expect(checkout.total).to eq 160
    checkout.scan('B'); expect(checkout.total).to eq 175
  end

  def price_of(goods)
    checkout = Checkout.new(RULES)
    goods.split(//).each { |item| checkout.scan(item) }
    checkout.total
  end
end
