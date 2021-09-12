Dado 'que existe(m) a(s) tag(s) cadastrada(s)' do |table|
  tags = table.hashes
  tags.each { |tag| create(:tag, title: tag['title']) }
end

Dado 'que o portfólio possui a tag {string}' do |tag|
  @portfolio.tags << Tag.find_by(title: tag)
end

Quando 'adiciona a tag {string}' do |tag|
  find('#autocomplete-tags').set(tag.to_s)
  find('#autocomplete-tags').send_keys(:enter)
  wait_for_ajax
end

Quando 'remove a tag {string}' do |tag|
  within('.chip', text: /#{tag}/) do
    find('i.close').click
  end
  wait_for_ajax
end

Então 'a tag {string} é adicionada ao Portfólio' do |tag|
  @portfolio.reload
  tag = Tag.find_by(title: tag)
  expect(@portfolio.tags).to include(tag)
end

Então 'a tag {string} não é adicionada ao Portfólio' do |tag|
  tag = Tag.find_by(title: tag)
  expect(@portfolio.tags).to_not include(tag)
end

Então 'a(s) mensage(m)(ns) de erro é(são) exibida(s)' do |table|
  errors = table.hashes
  errors.each { |error| expect(page).to have_content error['message'] }
end

Então 'a tag {string} é removida do Portfólio' do |tag|
  @portfolio.reload
  tag = Tag.find_by(title: tag)
  expect(@portfolio.tags).to_not include(tag)
end
