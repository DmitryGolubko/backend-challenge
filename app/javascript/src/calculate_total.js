$(document).ready(() => {
  $('.js--calculate-total').change(() => {
    $.ajax({
        url: '/orders/calculate_total',
        type: 'post',
        dataType: 'script',
        data: $('.js--calculate-total').serializeArray(),
        success: (res) => showTotal(res)
      }
    );
  })

  showTotal = (res) => {
    const data = JSON.parse(res)
    Object.keys(data).forEach(key => {
      $(`.js-${key}`).text(`${key}: $${data[key]}`)
    })
  }
})
