
    let roomType_selectedID;
    let roomType_allRoomTypes = document.querySelectorAll(".roomType_row");
    let roomType_allButtonNotClick = document.querySelectorAll(".functionality_item");
    let btnOfSelectedRow = null;
    let roomType_filterByString = '';
    let roomType_filterByBeds = [
        {
            label: "1 giường",
            status: false
        },
        {
            label: "2 giường",
            status: false
        },
        {
            label: "3 giường",
            status: false
        },
    ];
    // RenderFilterBedsCheckboxes
    roomType_filterByBeds.forEach((e,i) => {
        let divTag = document.createElement("div");
        divTag.setAttribute("class", "boloc_item");
        divTag.innerHTML = `
            <input class="boloc_checkbox" type="checkbox"/>
            <span class="boloc_label">${e.label}</span>
        `
        divTag.addEventListener('change', function() {
            roomType_filterByBeds[i].status = this.querySelector(".boloc_checkbox").checked;
            updateTable();
        });
        document.querySelector("#boloc_roomType_beds").append(divTag);
        
    })
    
    for(let i=0; i<roomType_allRoomTypes.length; i++){
        roomType_allRoomTypes[i].addEventListener('click', function(){
            for (let previousSelectedRow of document.querySelectorAll(".row_selected")) {
                previousSelectedRow.classList.remove("row_selected");
            }
            
            roomType_selectedID = roomType_allRoomTypes[i].querySelector(".roomType_row_id").innerHTML * 1;
            this.classList.add("row_selected");
            btnOfSelectedRow = this.querySelector(".btn_delete");

            for(let i=0; i<roomType_allButtonNotClick.length; i++){
                roomType_allButtonNotClick[i].classList.remove("functionality_item");
                roomType_allButtonNotClick[i].classList.add("button_selected");
            }
        });
    }

    document.querySelector("#roomType_btn_edit").addEventListener('click', function(){
        if (roomType_selectedID > 0) {
            window.location = `${window.location}/${roomType_selectedID}/edit`;
        }
        
    });
    document.querySelector("#roomType_btn_show").addEventListener('click', function(){
        if (roomType_selectedID > 0) {
            window.location = `${window.location}/${roomType_selectedID}`;
        }
    });
    document.querySelector("#roomType_btn_delete").addEventListener('click', function(){
        btnOfSelectedRow.click();
    });

    function isUsingFilterBeds(){
        for(let i=0; i<roomType_filterByBeds.length; i++){
            if(roomType_filterByBeds[i].status) return true;
        }
        return false;
    }
    function isUsingFilterAvailable(){
        for(let i=0; i<filterByAvailable.length; i++){
            if(filterByAvailable[i].status) return true;
        }
        return false;
    }

    document.querySelector("#roomType_input_filter").addEventListener('input', function(e){
        roomType_filterByString = e.target.value;
        updateTable();
    });

    function updateTable(){
        let hasAtLeastOneMatchedRow = false;
        for(let i=0; i<roomType_allRoomTypes.length; i++){
            
            let tRow = roomType_allRoomTypes[i];
            let tColumnDescription = tRow.querySelector(".roomType_row_description").innerHTML;
            let tColumnBeds = tRow.querySelector(".roomType_row_beds").innerHTML * 1;
            let tColumnAvailable = tRow.querySelector(".roomType_row_available").innerHTML * 1;

            if(!(tColumnDescription.toLowerCase().includes(roomType_filterByString.toLowerCase()))
                && roomType_filterByString.length > 0){
                tRow.classList.add("hide_row");
            }
            else if((!roomType_filterByBeds[tColumnBeds-1].status && isUsingFilterBeds())){
                tRow.classList.add("hide_row");
            }
            else{
                tRow.classList.remove("hide_row");
                hasAtLeastOneMatchedRow = true;
            }
        }
        
        if (hasAtLeastOneMatchedRow) {
            document.querySelector("#roomType_row_empty").classList.add("hide_empty");
        }else{
            document.querySelector("#roomType_row_empty").classList.remove("hide_empty");
        }
    }