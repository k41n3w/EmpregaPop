Dado 'possui {int} portfólio(s) cadastrado(s)' do |count|
  create_list(:portfolio, count, user_id: @user.id)
end

Quando 'acessa a lista de portfólios' do
  visit portfolios_path
end

Então 'os {int} portfólios são listados' do |count|
  expect(page).to have_css('.portfolio', count: count)
end

Então 'nenhum portfólio é listado' do
  expect(page).to have_css('.portfolio', count: 0)
end

Então 'volta para a página de login' do
  expect(page).to have_current_path('/users/sign_in')
end

Quando 'clica para criar um novo portfólio' do
  find(:xpath, "//a[@class='new-portfolio']").click
end

Então 'o usuário deve ter {int} portfólios cadastrados' do |count|
  expect(@user.portfolios.count).to eq count
end

Então "deve ver os dados iniciais do portfólio" do
  expect(page).to have_field("portfolio[slug]", with: @user.portfolios.last.slug)
end

Então 'é direcionado para a pagina de edição do portfólio' do
  expect(page).to have_current_path(edit_portfolio_path(@user.portfolios.last))
end

Dado 'acessa a página de edição do portfólio' do
  @portfolio ||= @user.portfolios.first
  visit edit_portfolio_path(@portfolio)
end

Quando 'edita o slug' do
  @new_value = 'new_slug'
  fill_in 'portfolio[slug]', with: @new_value
end

Quando 'sai do campo slug' do
  page.execute_script("document.getElementsByName('portfolio[slug]')[0].dispatchEvent(new Event('change'));")
end

Quando 'clica no switch {string}' do |field|
  @new_value = !@portfolio[field]
  all("input[name='portfolio[#{field}]'] + span.lever", visible: false).first.click
end

Quando 'clica no checkbox {string}' do |field|
  @new_value = !@portfolio[field]
  find("input[name='portfolio[#{field}]'] + span").click
end

Então 'o campo {string} do portfólio é atualizado' do |field|
  wait_for_ajax
  @portfolio.reload
  expect(@portfolio[field]).to eq(@new_value)
end

Dado 'possui o portfólio com slug {string}' do |slug|
  @portfolio = create(:portfolio, slug: slug, user_id: @user.id)
end
