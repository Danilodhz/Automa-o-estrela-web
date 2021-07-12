Dado("que eu acesso a pagina de login") do
  visit "/"
  find("#bf-js-login").click    #clico no botão login
  find("#loginWithUserAndPasswordBtn").click
end

Quando("eu preencho minhas informações") do |table|
  info = table.rows_hash
  find("#inputEmail").set info[:email]
  find("#inputPassword").set info[:senha]
  find("#classicLoginBtn").click                          #clico em enter
  find("#bf-js-login").click
  find('a[href="/account/"]').click
end

Então("me logo no site visualizando a {string}") do |string|
  minha_conta = find('div[class="bf-account__title"]')
  expect(minha_conta.text).to eql string
end

Quando("eu preencho o meu login sem o email") do |table|
  info = table.rows_hash
  find("#inputEmail").set info[:email]
  find("#inputPassword").set info[:senha]
  find("#classicLoginBtn").click                          #clico em enter
end

Então("eu vejo a mensagem de erro {string}") do |string|
  email_invalido = find('p[class="alert alert-warning alert-wrong-pswd"]')
  expect(email_invalido.text).to eql string
end

#Cenário: Validar senha não preenchida
Quando("eu preencho o meu login sem a senha") do |table|
  info = table.rows_hash
  find("#inputEmail").set info[:email]
  find("#inputPassword").set info[:senha]
  find("#classicLoginBtn").click
end

Então("eu vejo a mensagem de erro") do
  text "Preencha este campo."
end

Quando("eu não preencho nenhum campo") do |table|
  info = table.rows_hash
  find("#inputEmail").set info[:email]
  find("#inputPassword").set info[:senha]
  find("#classicLoginBtn").click
end

Então("eu visualizo a mensagem de erro") do
  text "Preencha este campo."
end
