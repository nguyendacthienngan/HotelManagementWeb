
    let selected_employeeID;

    // Map all HTML Row to Array JS
    let allEmployees = document.querySelectorAll(".employee_row");
    let allButtonNotClick = document.querySelectorAll(".functionality_item");
    
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
            label: "Quản Lý",
            status: false
        },
        {
            label: "Lễ Tân",
            status: false
        },
        {
            label: "Vệ Sinh",
            status: false
        },
        {
            label: "Bảo Vệ",
            status: false
        }
    ];
    let filterByStatus = [
        {
            label: "Đang làm",
            status: false
        },
        {
            label: "Nghỉ việc",
            status: false
        },
    ];

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
        document.querySelector("#boloc_employee_gender").append(divTag);
        
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
        document.querySelector("#boloc_employee_type").append(divTag);
    })
    // RenderFilterStatusCheckboxes
    filterByStatus.forEach((e,i) => {
        let divTag = document.createElement("div");
        divTag.setAttribute("class", "boloc_item");
        divTag.innerHTML = `
            <input class="boloc_checkbox" type="checkbox"/>
            <span class="boloc_label">${e.label}</span>
        `
        divTag.addEventListener('change', function() {
            filterByStatus[i].status = this.querySelector(".boloc_checkbox").checked;
            updateTable();
        });
        document.querySelector("#boloc_employee_status").append(divTag);
        
    })
    



    // Add onclick listener to each row
    for(let i=0; i<allEmployees.length; i++){
        allEmployees[i].addEventListener('click', function(){
            // Remove all color of previous selected row
            for (let previousSelectedRow of document.querySelectorAll(".row_selected")) {
                previousSelectedRow.classList.remove("row_selected");
            }
            
            selected_employeeID = allEmployees[i].querySelector(".employee_row_id").innerHTML * 1;
            this.classList.add("row_selected");
            for(let i=0; i<allButtonNotClick.length; i++){
                allButtonNotClick[i].classList.remove("functionality_item");
                allButtonNotClick[i].classList.add("button_selected");
            }
        });
    }

    document.querySelector("#employee_btn_edit").addEventListener('click', function(){
        if (selected_employeeID > 0) {
            window.location = `${window.location}/${selected_employeeID}/edit`;
        }
        
    });
    document.querySelector("#employee_btn_show").addEventListener('click', function(){
        if (selected_employeeID > 0) {
            window.location = `${window.location}/${selected_employeeID}`;
        }
    });

    document.querySelector("#employee_input_filter").addEventListener('input', function(e){
        filterByString = e.target.value;
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
    function isUsingFilterStatus(){
        for(let i=0; i<filterByStatus.length; i++){
            if(filterByStatus[i].status) return true;
        }
        return false;
    }

    function updateTable(){
        let hasAtLeastOneMatchedRow = false;
        //  console.log(isUsingFilterStatus());
        for(let i=0; i<allEmployees.length; i++){
            let tRow = allEmployees[i];
            let tColumnName = tRow.querySelector(".employee_row_name").innerHTML;
            let tColumnPhone = tRow.querySelector(".employee_row_phone").innerHTML;
            let tColumnAddress = tRow.querySelector(".employee_row_address").innerHTML;
            let tColumnType = tRow.querySelector("#employee_typeId").innerHTML * 1;
            let tColumnGender = tRow.querySelector("#employee_genderId").innerHTML * 1;
            let tColumnStatus = tRow.querySelector("#employee_statusId").innerHTML * 1;

            // Fiter by String
            if(!(tColumnName.toLowerCase().includes(filterByString.toLowerCase())
                || tColumnPhone.toLowerCase().includes(filterByString.toLowerCase()) 
                || tColumnAddress.toLowerCase().includes(filterByString.toLowerCase()))
                && filterByString.length > 0){
                tRow.classList.add("hide_row");
            }
            // Filter by Gender
            else if((!filterByType[tColumnType - 1].status && isUsingFilterType())
                    || (!filterByGender[tColumnGender - 1].status && isUsingFilterGender())
                    || (!filterByStatus[tColumnStatus - 1].status && isUsingFilterStatus())){
                tRow.classList.add("hide_row");
            }
            else{
                tRow.classList.remove("hide_row");
                hasAtLeastOneMatchedRow = true;
            }
        }

        
        if (hasAtLeastOneMatchedRow) {
            document.querySelector("#employee_row_empty").classList.add("hide_empty");
        }else{
            document.querySelector("#employee_row_empty").classList.remove("hide_empty");
        }
    }