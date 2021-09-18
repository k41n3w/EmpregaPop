# language:pt
 
@javascript
Funcionalidade: Adicionar um bloco ao Portfólio
  Adiciona um novo bloco de algum tipo ao Portfolio
 
  Cenário de Fundo:
    Dado usuário está logado
    E possui o portfólio com slug 'my_portfolio'
    E acessa a página de edição do portfólio
 
  Cenário: Usuário adiciona uma novo bloco ao Portfolio
    Quando adiciona um bloco 'Perfil' à esquerda
    Então o bloco 'Perfil' é adicionado ao portfólio
 
  Cenário: Bloco já existe
    Dado portfólio possui o bloco 'Educação' à direita
    Quando adiciona um bloco 'Educação' à direita
    Então a mensagem de erro é exibida
      | message                       |
      | Kind has already been taken  |
