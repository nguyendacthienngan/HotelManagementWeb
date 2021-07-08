
let selected_clientID;
let filterByString = '';
let filterByGender = [
    {
        label: "Nam",
        status: false
    },
    {
        label: "Nữ",
        status: false
    },
    {
        label: "Khác",
        status: false
    },
];
let filterByType = [
    {
        label: "Khách lữ hành",
        status: false
    },
    {
        label: "Thành viên",
        status: false
    },
];
let filterByDobSelectedOption = 0;
let filterByDobOptions = [
    {
        label: "-",
    },
    {
        label: "Tháng 1",
    },
    {
        label: "Tháng 2",
    },
    {
        label: "Tháng 3",
    },
    {
        label: "Tháng 4",
    },
    {
        label: "Tháng 5",
    },
    {
        label: "Tháng 6",
    },
    {
        label: "Tháng 7",
    },
    {
        label: "Tháng 8",
    },
    {
        label: "Tháng 9",
    },
    {
        label: "Tháng 10",
    },
    {
        label: "Tháng 11",
    },
    {
        label: "Tháng 12",
    },
];

let allClients = document.querySelectorAll(".client_row");
let allButtonNotClick = document.querySelectorAll(".functionality_item");

for(let i=0; i<allClients.length; i++){
    allClients[i].addEventListener('click', function(){
                for (let previousSelectedRow of document.querySelectorAll(".row_selected")) {
                        previousSelectedRow.classList.remove("row_selected");
                }
                
                selected_clientID = allClients[i].querySelector(".client_row_id").innerHTML * 1;
                this.classList.add("row_selected");
                for(let i=0; i<allButtonNotClick.length; i++){
                        allButtonNotClick[i].classList.remove("functionality_item");
                        allButtonNotClick[i].classList.add("button_selected");
                }
        });
}

document.querySelector("#client_btn_edit").addEventListener('click', function(){
        if (selected_clientID > 0) {
                window.location = `${window.location}/${selected_clientID}/edit`;
        }
        
});
document.querySelector("#client_btn_show").addEventListener('click', function(){
        if (selected_clientID > 0) {
                window.location = `${window.location}/${selected_clientID}`;
        }
});

// RenderFilterGenderCheckboxes
filterByGender.forEach((e,i) => {
    let divTag = document.createElement("div");
    divTag.setAttribute("class", "boloc_item");
    divTag.innerHTML = `
        <input class="boloc_checkbox" type="checkbox"/>
        <span class="boloc_label">${e.label}</span>
    `
    divTag.addEventListener('change', function() {
        filterByGender[i].status = this.querySelector(".boloc_checkbox").checked;
        updateTable();
    });
    document.querySelector("#boloc_client_gender").append(divTag);
    
})
// RenderFilterTypeCheckboxes
filterByType.forEach((e,i) => {
    let divTag = document.createElement("div");
    divTag.setAttribute("class", "boloc_item");
    divTag.innerHTML = `
        <input class="boloc_checkbox" type="checkbox"/>
        <span class="boloc_label">${e.label}</span>
    `
    divTag.addEventListener('change', function() {
        filterByType[i].status = this.querySelector(".boloc_checkbox").checked;
        updateTable();
    });
    document.querySelector("#boloc_client_type").append(divTag);
})
let selectTag = document.getElementById("boloc_client_dob");
// RenderFilterDobSelect
filterByDobOptions.forEach((e,i) => {
      let option = document.createElement("option");
    option.setAttribute("class", "boloc_select");
    option.text = e.label;
    option.setAttribute("value", i);
    selectTag.add(option, selectTag[i]);
})
selectTag.addEventListener('change', function(e) {
    filterByDobSelectedOption = e.target.value * 1;
    updateTable();
});

function isUsingFilterType(){
    for(let i=0; i<filterByType.length; i++){
        if(filterByType[i].status) return true;
    }
    return false;
}
function isUsingFilterGender(){
    for(let i=0; i<filterByGender.length; i++){
        if(filterByGender[i].status) return true;
    }
    return false;
}


document.querySelector("#client_input_filter").addEventListener('input', function(e){
    filterByString = e.target.value;
    updateTable();
});

function updateTable(){
    let hasAtLeastOneMatchedRow = false;
    for(let i=0; i<allClients.length; i++){
        let tRow = allClients[i];
        let tColumnName = tRow.querySelector(".client_row_name").innerHTML;
        let tColumnPhone = tRow.querySelector(".client_row_phone").innerHTML;
        let tColumnEmail = tRow.querySelector(".client_row_email").innerHTML;
        let tColumnType = tRow.querySelector("#client_typeId").innerHTML * 1;
        let tColumnGender = tRow.querySelector("#client_genderId").innerHTML * 1;
        let tColumnDob = (new Date(tRow.querySelector("#client_dob").innerHTML)).getMonth() + 1;
        
        if(!(tColumnName.toLowerCase().includes(filterByString.toLowerCase())
            || tColumnPhone.toLowerCase().includes(filterByString.toLowerCase())
            || tColumnEmail.toLowerCase().includes(filterByString.toLowerCase())
            && filterByString.length > 0) 
            || (tColumnDob*1 !== filterByDobSelectedOption*1 && filterByDobSelectedOption !== 0)){
            tRow.classList.add("hide_row");
        }
        else if((!filterByType[tColumnType - 1].status && isUsingFilterType())
                || (!filterByGender[tColumnGender - 1].status && isUsingFilterGender())){
            tRow.classList.add("hide_row");
        }
        else{
            tRow.classList.remove("hide_row");
            hasAtLeastOneMatchedRow = true;
        }
    }

    if (hasAtLeastOneMatchedRow) {
        document.querySelector("#client_row_empty").classList.add("hide_empty");
    }else{
        document.querySelector("#client_row_empty").classList.remove("hide_empty");
    }
}