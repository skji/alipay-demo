class Service::CreatePartnerTradeByBuyersController < ApplicationController
  def new
  end

  def create
    order = Order.create

    redirect_to Alipay::Service.create_partner_trade_by_buyer_url(
      out_trade_no: order.number,
      subject: "AlipayDemo #{order.number}",
      price: order.price,
      quantity: 1,
      discount: 0,
      return_url: return_service_create_partner_trade_by_buyer_url,
      notify_url: notify_service_create_partner_trade_by_buyer_url,
      logistics_type: 'DIRECT',
      logistics_fee: 0,
      logistics_payment: 'SELLER_PAY',
      receive_name: 'none',
      receive_address: 'none',
      receive_zip: '100000',
      receive_mobile: '100000000000'
    )
  end
end
