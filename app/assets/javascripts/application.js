
var COIN = '';
var SERIES = [];
var CATEGORIES = [];

var get_coin = function(coin){
  console.log(coin);
  COIN = coin;

  loadCategories();
  loadSeries(coin);
  loadChart();
};

var loadSeries = function(coin){
  $.ajax({
    method: 'GET',
    url: "http://localhost:3000/conversors/get_exchange/"+coin
  })
  .done(function(data)
  {
    SERIES = data;
  });
};

var loadCategories = function(){
  $.ajax({
    method: 'GET',
    url: "http://localhost:3000/conversors/get_categories"
  })
  .done(function(dates)
  {
    CATEGORIES = dates;
  });
};


var loadChart = function(){
  Highcharts.chart('container', {
      title: {
          text: 'CÂMBIO',
          x: -20 //center
      },
      subtitle: {
          text: COIN,
          x: -20
      },
      xAxis: {
          categories: CATEGORIES
      },
      yAxis: {
          title: {
              text: 'Valor'
          },
          plotLines: [{
              value: 0,
              width: 1,
              color: '#808080'
          }]
      },
      tooltip: {
          valueSuffix: 'R$'
      },
      legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
      },
      series: [SERIES]
  });

};

loadCategories();
