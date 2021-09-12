# language:pt
 
@javascript
Funcionalidade: Adicionar Tags ao Portfólio
  Adiciona tags ao Portfólio
 
  Cenário de Fundo:
    Dado que existem as tags cadastradas
      | title   |
      | Python  |
      | Ruby    |
      | NodeJS  |
    E usuário está logado
    E possui o portfólio com slug 'my_portfolio'
    E acessa a página de edição do portfólio
 
  Cenário: Usuário adiciona uma nova tag ao Portfólio
    Quando adiciona a tag 'Ruby'
    Então a tag 'Ruby' é adicionada ao Portfólio
 
  Cenário: Tag inexistente
    Quando adiciona a tag 'Golang'
    Então a tag 'Golang' não é adicionada ao Portfólio
 
  Cenário: Tag já foi adicionada
    E que o portfólio possui a tag 'Ruby'
    Quando adiciona a tag 'Ruby'
    Então a mensagem de erro é exibida
      | message                     |
      | Tag has already been taken  |
