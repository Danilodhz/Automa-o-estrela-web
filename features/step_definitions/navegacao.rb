Dado("que o usuário acesse o site") do
  visit "/"
end

Quando("ele clicar no carrossel") do
  find('div[class="bf-slider-principal__arrow bf-slider-principal__arrow--next slick-arrow"]').click
end

Então("ele visualiza o próximo banner") do
  expect(page).to have_css('img[src="https://estrelalojas.vteximg.com.br/arquivos/ids/480044/Informaçoes - Estrela (Banner) (3).png?v=637511547022170000"]')
end

Quando("ele clicar em feminino") do
  visit "/feminino"
end

Então("ele será redirecionado para a categoria {string}") do |string|
  teste = find('div[class="bf-category__title"]')
  expect(teste.text).to eql string
end

Quando("ele interagir com algum botão na pagina") do
  visit "/masculino"
  find('a[title="MASCULINO"]', :text => "masculino")
  find('a[href="https://www.estrelalojas.com.br/camiseta-masculina-1dasul-branco/p"]').click
end

Então("ele visualiza o bradcrump de onde ele clicou") do
  expect(page).to have_css('span[itemprop="name"]', :text => "camisetas")
end
