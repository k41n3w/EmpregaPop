Dado("que o usuário está na página principal") do
  visit root_path
end
 
Dado("clica no link Entrar") do
  within "div.nav-wrapper" do
    click_on "Entrar"
  end
end
 
Dado("que o usuário tem paramêtros válidos") do
  @user = create(:user)
end
 
Quando("preenche e submete o formulário") do
  fill_in "user[email]", with: @user.email
  fill_in "user[password]", with: @user.password
  click_button "ENTRAR"
end
 
Então("o usuário deve ver seus portfólios") do
  expect(page).to have_text("Seus Portfólios")
end
 
Então("é visível o link sair") do
  expect(page).to have_link('Sair')
end
 
Dado("que o usuário tem paramêtros inválidos") do
  @user = User.new(attributes_for(:user))
end
 
Quando("preenche com dados inválidos e submete o formulário") do
  fill_in "user[email]", with: @user[:email]
  fill_in "user[password]", with: @user[:password]
  click_button "ENTRAR"
end
 
Então("o usuário permanece na página de login") do
  expect(page).to have_current_path('/users/sign_in')
end
