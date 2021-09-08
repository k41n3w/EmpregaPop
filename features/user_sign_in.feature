# language:pt
 
  @user_sign_in
  Funcionalidade: Fazer login
    O usuário é logado no sistema obtendo acesso os seus dados
 
    Cenário de Fundo:
      Dado que o usuário está na página principal
      E clica no link Entrar
 
    Cenário: Credenciais válidas
      Dado que o usuário tem paramêtros válidos
      Quando preenche e submete o formulário
      Então o usuário deve ver seus portfólios
      E é visível o link sair
 
    Cenário: Credenciais inválidas
      Dado que o usuário tem paramêtros inválidos
      Quando preenche e submete o formulário
      Então o usuário permanece na página de login
