class Admin::OfferPresenter < SimpleDelegator
  attr_reader :offer

  def initialize(offer)
    @offer = offer
    __setobj__(offer)
  end

  def url
    helper.content_tag :a, offer.url, href: offer.url, target: '_blank'
  end

  def state
    I18n.t("page.admin.offer.status", count: offer.enabled? && 1 || 0)
  end

  def actions
    helper.content_tag :div, class: 'action-buttons' do
      helper.concat edit_link
      helper.concat enabled_link
      helper.concat destroy_link
    end
  end

  private

  def enabled_link
    type = offer.enabled? ? 'disabled' : 'enabled'
    helper.link_to I18n.t("page.admin.offer.actions.button.#{type}"), "/admin/offers/#{offer.id}/#{type}",
      class: "btn btn-default btn-sm btn-action--#{type}"
  end

  def edit_link
    helper.link_to I18n.t('page.admin.offer.actions.button.edit'), route.edit_admin_offer_path(@offer.id),
      class: 'btn btn-default btn-sm btn-action--edit'
  end

  def destroy_link
    helper.link_to I18n.t('page.admin.offer.actions.button.destroy'), route.admin_offer_path(@offer.id),
      method: :delete,
      data: { confirm: I18n.t('page.admin.offer.messages.confirm') },
      class: 'btn btn-default btn-sm btn-action--destroy'
  end

  def helper
    @helper ||= ActionController::Base.helpers
  end

  def route
    @route ||= Rails.application.routes.url_helpers
  end
end
