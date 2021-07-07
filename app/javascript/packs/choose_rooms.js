let room_types = {}
let rooms = [];
export function pay(){
    let chosen_rooms = []
    let i = 0
    if (rooms.length > 0)
    {
        for (i in rooms)
        {
            let room = {id: rooms[i]};
            chosen_rooms.push(room)
        }
        $.ajax({
            type: "POST",
            url: "/cooperate_reservation/choose_rooms",
            // The key needs to match your method's input parameter (case-sensitive).
            data: JSON.stringify(
                {
                    arrival_date: $('#arrival_date').val(),
                    leave_date: $('#leave_date').val(),
                    rooms: chosen_rooms
                }),
            contentType: "application/json; charset=utf-8",
            success: function(res){
                $("#choose_rooms").load(location.href+ ' #test');
            }
        });
    }
    else
    {
        alert("Please choose at least 1 room")
    }
}$(document).ready(function(){
    $('#pay-button').click(function(){
        pay()

    })
    $('.room').click(function(e){
        // Change button state
        let target = $(e.target)
        let id = e.target.id
        let result_id = "result_" + id

        let room_type = $(this).closest('.card')
        let room_type_id = "#result_" + room_type.attr('id').toString()
        let room_type_name = room_type.attr('id').toString()



        let amount_reserve_id = '#amount_' + room_type.attr('id').toString()
        let amount_reserve = $(amount_reserve_id).text()
        amount_reserve = parseInt(amount_reserve)

        if (target.text() != "✓")
        {
            amount_reserve = ++amount_reserve
            rooms.push(id)
            let rooms_string =  '[' +  rooms.toString() + ']'
            let room_type_object = {id: room_type_name, count: amount_reserve, chosen_rooms:  rooms.toString()}
            room_types[room_type_name] = room_type_object

            setRooms(rooms)
            target.removeClass('inactive-room')
            target.addClass('active-room')
            target.text("✓")
            // Add to results
            let string = "<div id=" + result_id + " class='col-md-3 chip'>" + e.target.id + "</div>"

            $(room_type_id).append(string)
            $(amount_reserve_id).text(amount_reserve)
        }
        else
        {
            let room_index = rooms.indexOf(id);
            if (room_index > -1) {
                rooms.splice(room_index, 1);
            }
            if (room_index > -1)
            {
                const r_type = room_types[room_type_name]
                if (r_type)
                {
                    let rs = r_type.chosen_rooms
                    rs = rs.split(', ')
                    if (rs.length > 0)
                    {
                        r_type["count"] = r_type["count"] - 1
                        rs.splice(room_index, 1)
                        if (r_type["count"] <= 0)
                            delete room_types[room_type_name]
                    }
                }


            }
            target.text(e.target.id)
            target.addClass('inactive-room')
            target.removeClass('active-room')
            $('#' + result_id).remove()

            $(amount_reserve_id).text(--amount_reserve)
        }

    })
})

