# Inncurrency
## Seu conversor de Moedas

Teste para dev na Innvent.

**História do Usuário:**
Preciso que em meu site tenha uma página com um gráfico que apresente a cotação dos últimos sete dias para real versus dólar, euro e pesos argentinos. A página deve ter três botões (um para cada uma das moedas) e, ao clicar nos botões, apareceria o gráfico de linha com os valores abaixo dos botões. Parecido com esse site aqui: 
http://economia.uol.com.br/cotacoes/cambio/euro-uniao-europeia/

**Características:**
* Backend em Ruby on Rails
* Front com JQuery, Bootstrap 4 e Highcharts
* API Currencylayer para coleta das conversões de moedas
* Deploy no Heroku
* Testes com Rspec

**Instalando**
```
cd inncurrency
bundle install
rake db:create db:migrate
```

**Testando**
```
rake db:migrate RAILS_ENV=test
```

**Rodando**
```
rails server
```

Por padrão irá rodar em http://localhost:3000
