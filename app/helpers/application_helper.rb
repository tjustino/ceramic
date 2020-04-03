# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def nbsp
    [160].pack("U*")
  end

  def single_icon(icon)
    content_tag(:i, nil, class: icon)
  end

  def icon_text(icon, text)
    safe_join([single_icon(icon), text], nbsp)
  end

  def text_icon(text, icon)
    safe_join([text, single_icon(icon)], nbsp)
  end

  def icon_text_icon(first_icon, text, second_icon = nil)
    second_icon = first_icon if second_icon.nil?
    safe_join([single_icon(first_icon), text, single_icon(second_icon)], nbsp)
  end

  def line_break(product_tags)
    product_tags = product_tags.order(:name)
    list_of_tags = [product_tags.first.name]

    product_tags.offset(1).each do |product_tag|
      list_of_tags << product_tag.name
    end

    safe_join(list_of_tags, tag.br)
  end

  def abbreviation(acronym, definition)
    content_tag(:abbr, acronym, title: definition)
  end
end
