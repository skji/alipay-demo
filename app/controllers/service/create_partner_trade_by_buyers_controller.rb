class Service::CreatePartnerTradeByBuyersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:notify]
  before_action :verify_alipay_notify, only: [:show, :notify]

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
      return_url: service_create_partner_trade_by_buyer_url,
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

  def show
  end

  def notify
    if @verify
      # business logic
      case params[:trade_status]
      when 'WAIT_BUYER_PAY'
      when 'WAIT_SELLER_SEND_GOODS'
      when 'TRADE_FINISHED'
      when 'TRADE_CLOSED'
      end

      render text: 'success'
    else
      render text: 'fail'
    end
  end

  private

  def verify_alipay_notify
    @verify = Alipay::Notify.verify?(params.except(:controller, :action))
    logger.info "Alipay notify verify: #{@verify}"
  end
end
