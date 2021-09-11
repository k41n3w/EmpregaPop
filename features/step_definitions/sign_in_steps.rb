Dado 'usuário está logado' do
  create_user
  user_login
end

Dado 'usuário não está logado' do
  create_user
end

Quando 'faz o logout' do
  within 'div.nav-wrapper' do
    click_on 'Sair'
  end
end

def create_user
  @user = create(:user)
end

def user_login
  visit '/users/sign_in'
  fill_in 'user[email]', with: @user.email
  fill_in 'user[password]', with: @user.password
  click_button 'Log in'
end
