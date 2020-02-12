# frozen_string_literal: true

module ApplicationHelper
  def nbsp
    [160].pack("U*")
  end

  def single_icon(icon)
    content_tag(:i, nil, class: icon)
  end

  def icon_text(icon, text)
    content_tag(:i, nil, class: icon) + nbsp + text
  end

  def text_icon(text, icon)
    (text + nbsp + content_tag(:i, nil, class: icon)).html_safe
  end

  def icon_text_icon(first_icon, text, second_icon = nil)
    second_icon = first_icon if second_icon.nil?
    content_tag(:i, nil, class: first_icon) + nbsp + text +
      nbsp + content_tag(:i, nil, class: second_icon)
  end

  def line_break(product_tags)
    product_tags = product_tags.order(:name)
    list_of_tags = product_tags.first.name

    product_tags.offset(1).each do |product_tag|
      list_of_tags << tag.br + product_tag.name
    end

    list_of_tags
  end
end
