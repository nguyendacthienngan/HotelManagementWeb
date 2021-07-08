$(document).ready(function(){
    let total_caculate = $('#total_calculate').text()
    total_caculate = parseFloat(total_caculate)
    console.log(total_caculate)
    $('#payment_total').val(total_caculate)
});
