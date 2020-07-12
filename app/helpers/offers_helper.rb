module OffersHelper
  def show_messages
    flash[:error].present? && error(flash[:error]) || ''
  end

  private

  def error(messages = [])
    content_message(messages, class: 'alert alert-danger').html_safe
  end

  def content_message(messages, args = {})
    content_tag :div, args do
      messages.collect { |message| concat content_tag(:p, message) }
    end
  end
end
