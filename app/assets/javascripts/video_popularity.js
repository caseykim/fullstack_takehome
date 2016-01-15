$(function () {
  $.ajax({
      method: 'GET',
      url: '/videos',
      dataType: 'json'
  })

  .done(function(data){
    var videoNames = data[0];
    var views = data[1];

    $('#container-video').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Videos'
        },
        xAxis: {
            categories: videoNames
        },
        yAxis: {
            title: {
                text: 'Number of views'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000 + 'k';
                }
            }
        },
        plotOptions: {
            column: {
                groupPadding: 0,
                pointPadding: 0,
                borderWidth: 0
            }
        },
        series: [{
            data: views
        }]
    });
  });
});
