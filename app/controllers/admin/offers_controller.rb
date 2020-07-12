class Admin::OffersController < AdminController
  before_action :offer, only: [:edit, :state]

  def index
    @offers = Offer.all.order(id: :desc).map { |offer| ::Admin::OfferPresenter.new(offer) }
  end

  def new
    @offer = Offer.new
  end

  def edit
    @offer = offer
  end

  def create
    result = service.save
    respond_to do |format|
      if result.success?
        format.html { redirect_to admin_path }
        format.js
      else
        flash[:error] = result.errors
        format.html { redirect_back(fallback_location: :new) }
        format.js
      end
    end
  end

  def update
    result = service.save(action: Operations::Offers::Update.new(offer))
    respond_to do |format|
      if result.success?
        format.html { redirect_to admin_path }
        format.js
      else
        flash[:error] = result.errors
        format.html { redirect_back(fallback_location: :edit) }
        format.js
      end
    end
  end

  def destroy
    offer.destroy
    redirect_to admin_path
  rescue => e
    flash[:error] = [t('operations.standard_error')]
    redirect_to admin_path
  end

  def state
    offer.change!(params[:state])
    redirect_to admin_path
  rescue => e
    flash[:error] = [t('operations.standard_error')]
    redirect_to admin_path
  end

  private

  def service
    @services ||= Services::Offer::Base.new(params_permited)
  end

  def offer
    @offer ||= Offer.find(params[:id])
  end

  def params_permited
    params.require(:offer).permit(
      :advertiser_name, :url, :description, :start_at, :end_at, :premium, :action
    )
  end
end
