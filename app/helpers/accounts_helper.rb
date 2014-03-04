module AccountsHelper
  def currency(amount)
    if amount < 0
      content_tag(:span, number_to_currency(amount), class: 'negative')
    else
      content_tag(:span, number_to_currency(amount))
    end
  end
end
