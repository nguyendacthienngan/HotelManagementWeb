import {calculateDifferenceBetween2Dates} from './utils';

function convertCurrencyToPrice(currency)
{
    return currency.replace('VND','').replace(',','')
}
function calculateTotal()
{
    let total = 0
    let prices = $('.room_price')
    prices.each(function (i, obj){
        let price = convertCurrencyToPrice($( this ).text())
        total += parseInt(price)
    })
    let children_values = $('.children')
    children_values.each(function (i, obj){
            let children = $( this ).val()
            let adults = $( this ).closest('.card-body').find('.adults').val()
            let adultPrice = $( this ).closest('.card-body').find('.adults_price').text()
            let childrenPrice = $( this ).closest('.card-body').find('.children_price').text()

            total += children * parseInt(childrenPrice);
            total += adults * parseInt(adultPrice);

        }
    )
    let arrivalDate = $('#arrival_date').text()
    let leaveDate = $('#leave_date').text()

    let differenceBetween2Dates = calculateDifferenceBetween2Dates(arrivalDate, leaveDate)
    total *= differenceBetween2Dates
    $('#temp_total').val(total)
    $('#deposit').val(total/2)
}

$(document).ready(function(){
    calculateTotal();

    $('.children').change(function(){
        calculateTotal()
    })
    $('.adults').change(function(){
        calculateTotal()
    })
});