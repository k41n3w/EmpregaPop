# language:pt
 
@javascript
Funcionalidade: Editar Portfólio
  Editar os campos do Portfólio
 
  Cenário de Fundo:
    Dado usuário está logado
    E possui 1 portfólio cadastrado
    E acessa a página de edição do portfólio
 
  Cenário: Usuário edita o slug de um portfólio
    Quando edita o slug
    E sai do campo slug
    Então o campo 'slug' do portfólio é atualizado
 
  Cenário: Usuário edita o campo ativo de um portfólio
    Quando clica no switch 'active'
    Então o campo 'active' do portfólio é atualizado
 
  Cenário: Usuário edita o campo listado de um portfólio
    Quando clica no switch 'listed'
    Então o campo 'listed' do portfólio é atualizado
 
  Cenário: Usuário edita o campo Remote OK de um portfólio
    Quando clica no checkbox 'remote_ok'
    Então o campo 'remote_ok' do portfólio é atualizado
