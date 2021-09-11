module PortfolioHelper
  def render_profile_photo(portfolio)
    if portfolio.profile.present? && portfolio.profile.photo.attached?
      image_url = url_for(portfolio.profile.photo.variant(resize: '62x62'))
    end
    image_url ||= "avatars/#{portfolio.temp_avatar}"
    image_tag image_url
  end

  def render_profile_name(portfolio)
    return portfolio.profile.name if portfolio.profile.present?

    'Ainda não preenchido'
  end

  def render_profile_title(portfolio)
    return portfolio.profile.title if portfolio.profile.present?

    'Ainda não preenchido'
  end

  def render_portfolio_tags(tags)
    disabled_tags_quant = Portfolio::MAX_NUMBER_OF_TAGS - tags.count
    tags.each { |tag| concat draw_tag(tag.title) }
    disabled_tags_quant.times { concat draw_tag(unused_label, color: 'grey') }
  end

  private

  def unused_label
    content_tag :i, 'Vázia'
  end

  def draw_tag(title, color: 'blue-grey')
    content_tag :div, class: 'col s12 m6 l6' do
      concat content_tag :span, title, class: "label #{color} #{color}-darken-5 #{color}-text text-lighten-4"
    end
  end
end
