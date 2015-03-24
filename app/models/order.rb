class Order < ActiveRecord::Base
  after_create :set_number

  def set_number
    update_column :number, "#{created_at.to_s :number}-#{id}"
  end

  def price
    0.01
  end
end
