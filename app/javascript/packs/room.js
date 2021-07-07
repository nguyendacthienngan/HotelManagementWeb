
  let selected_roomID;

  // Map all HTML Row to Array JS
  let allRooms = document.querySelectorAll(".room_row");
  let allButtonNotClick = document.querySelectorAll(".functionality_item");
  let filterByPriceFrom = ''; let filterByPriceTo = '';
  let filterByString = '';
  let filterByStatus = [
      {
          label: "Trống",
          status: false
      },
      {
          label: "Đã đặt",
          status: false
      },
      {
          label: "Quá hạn",
          status: false
      },
      {
          label: "Đang ở",
          status: false
      },
      {
          label: "Bẩn",
          status: false
      },
  ];
  let filterByType = [
      {
          label: "Standard",
          status: false
      },
      {
          label: "Superior Twin",
          status: false
      },
      {
          label: "Superior Double",
          status: false
      },
      {
          label: "Deluxe Twin",
          status: false
      },
      {
          label: "Deluxe Double",
          status: false
      },
      {
          label: "Suite Double",
          status: false
      },
  ];
  let filterByFloor = [
      {
          label: "Tầng 1",
          status: false
      },
      {
          label: "Tầng 2",
          status: false
      },
      {
          label: "Tầng 3",
          status: false
      },
  ];
    let filterByPriceMin = 0;
    let filterByPriceMax = 0;
    btn_ApDungChoised.addEventListener('click', function() {
        let minPrice = document.querySelector("#room_input_filter_priceFroom").value * 1;
        let maxPrice = document.querySelector("#room_input_filter_priceTo").value * 1;
        if (minPrice<=maxPrice || maxPrice===0) {
            filterByPriceMin = minPrice ; 
            filterByPriceMax = maxPrice;
            updateTable();
        } else {
            alert('Giá trị giá tối thiểu phải bé hơn giá trị giá tối đa');
        }
    });
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
      document.querySelector("#boloc_room_status").append(divTag);
      
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
        document.querySelector("#boloc_room_type").append(divTag);
    })
    // RenderFilterFloorCheckboxes
    filterByFloor.forEach((e,i) => {
        let divTag = document.createElement("div");
        divTag.setAttribute("class", "boloc_item");
        divTag.innerHTML = `
            <input class="boloc_checkbox" type="checkbox"/>
            <span class="boloc_label">${e.label}</span>
        `
        divTag.addEventListener('change', function() {
          filterByFloor[i].status = this.querySelector(".boloc_checkbox").checked;
            updateTable();
        });
        document.querySelector("#boloc_room_floor").append(divTag);
        
    })


  // Add onclick listener to each row
  for(let i=0; i<allRooms.length; i++){
    allRooms[i].addEventListener('click', function(){
          // Remove all color of previous selected row
          for (let previousSelectedRow of document.querySelectorAll(".row_selected")) {
              previousSelectedRow.classList.remove("row_selected");
          }
          
          selected_roomID = allRooms[i].querySelector(".room_row_id").innerHTML * 1;
          this.classList.add("row_selected");
          for(let i=0; i<allButtonNotClick.length; i++){
              allButtonNotClick[i].classList.remove("functionality_item");
              allButtonNotClick[i].classList.add("button_selected");
          }
      });
  }

  document.querySelector("#room_btn_edit").addEventListener('click', function(){
      if (selected_roomID > 0) {
          window.location = `${window.location}/${selected_roomID}/edit`;
      }
      
  });
  document.querySelector("#room_btn_show").addEventListener('click', function(){
      if (selected_roomID > 0) {
          window.location = `${window.location}/${selected_roomID}`;
      }
  });

  document.querySelector("#room_input_filter").addEventListener('input', function(e){
      filterByString = e.target.value;
      updateTable();
  });

  

  function isUsingFilterStatus(){
      for(let i=0; i<filterByStatus.length; i++){
          if(filterByStatus[i].status) return true;
      }
      return false;
  }
  function isUsingFilterType(){
      for(let i=0; i<filterByType.length; i++){
          if(filterByType[i].status) return true;
      }
      return false;
  }
  function isUsingFilterFloor(){
      for(let i=0; i<filterByFloor.length; i++){
          if(filterByFloor[i].status) return true;
      }
      return false;
  }

  function updateTable(){
      let hasAtLeastOneMatchedRow = false;
      for(let i=0; i<allRooms.length; i++){
          let tRow = allRooms[i];
          let tColumnName = tRow.querySelector(".room_row_name").innerHTML;
          let tColumnDescription = tRow.querySelector(".room_row_description").innerHTML;
          let tColumnStatus = tRow.querySelector("#room_statusId").innerHTML * 1;
          let tColumnType = tRow.querySelector("#room_typeId").innerHTML * 1;
          let tColumnFloor = tRow.querySelector("#room_floorId").innerHTML * 1;
          let tColumnPrice = tRow.querySelector("#room_priceId").innerHTML * 1;
          // Fiter by String
          if(!(tColumnName.toLowerCase().includes(filterByString.toLowerCase())
                || tColumnDescription.toLowerCase().includes(filterByString.toLowerCase())
                && filterByString.length > 0)
                || (((tColumnPrice < filterByPriceMin && filterByPriceMin > 0) || (tColumnPrice > filterByPriceMax && filterByPriceMax > 0)) && filterByString.length <= 0)){
              tRow.classList.add("hide_row");
          }
          
          // Filter by Gender
          else if((!filterByStatus[tColumnStatus-1].status && isUsingFilterStatus())
                  ||(!filterByType[tColumnType-1].status && isUsingFilterType())
                  ||(!filterByFloor[tColumnFloor-1].status && isUsingFilterFloor())){
              tRow.classList.add("hide_row");
          }
          else{
              tRow.classList.remove("hide_row");
              hasAtLeastOneMatchedRow = true; 
          }
      }

      
      if (hasAtLeastOneMatchedRow) {
          document.querySelector("#room_row_empty").classList.add("hide_empty");
      }else{
          document.querySelector("#room_row_empty").classList.remove("hide_empty");
      }
  }
  