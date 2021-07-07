export function calculateDifferenceBetween2Dates(date1, date2){
    // https://stackoverflow.com/questions/3224834/get-difference-between-2-dates-in-javascript
    date1 = convertStringToDate(date1);
    date2 = convertStringToDate(date2);
    if (date1 > date2)
        return 0;
    let diffTime = Math.abs(date1 - date2);
    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays //days
    // console.log(diffDays + " days");
}
export function validDifferenceBetween2DatesWithDash(date1, date2)
{
    date1 = convertStringToDateWithDash(date1);
    date2 = convertStringToDateWithDash(date2);
    if (date1 > date2)
        return false;
    return true
}
export function validDifferenceBetween2Dates(date1, date2)
{
    date1 = convertStringToDate(date1);
    date2 = convertStringToDate(date2);
    if (date1 > date2)
        return false;
    return true
}
export function convertStringToDate(date)
{
    //DD/MM/YYYY format
    // https://stackoverflow.com/questions/33299687/how-to-convert-dd-mm-yyyy-string-into-javascript-date-object
    date = date.split("/");
    return  new Date(+date[2], date[1] - 1, +date[0]);
}
export function convertStringToDateWithDash(date)
{
    date = date.split("-");
    return  new Date(+date[2], date[1] - 1, +date[0]);
}