class OffersController < ApplicationController
  def index
    @offer = Offer.all
  end

  def create
    respose = service.create
  end

  private

  def service
    @services ||= Services::Offer::Base.new(params_permited)
  end

  def params_permited
    params.require(:offer).permit(
      :advertiser_name, :url, :description, :start_at, :end_at, :premium
    )
  end
end
