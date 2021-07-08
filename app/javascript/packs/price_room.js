
  let selected_priceRoomID;
  let allRoomPrices = document.querySelectorAll(".roomPrice_row");
  let allButtonNotClick = document.querySelectorAll(".functionality_item");
  let filterByString = '';
  let  filterByPriceType= [
      {
          label: "Giá theo giờ",
          status: false
      },
      {
          label: "Giá theo ngày",
          status: false
      },
      {
          label: "Giá theo tuần",
          status: false
      },
      {
          label: "Giá theo tháng",
          status: false
      },
      {
          label: "Giá theo năm",
          status: false
      },
      {
          label: "Giá thêm người lớn",
          status: false
      },
      {
          label: "Giá thêm trẻ em",
          status: false
      },
  ];
  let filterByRoomType = [
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
  let filterByAvailable = [
      {
          label: "Đang áp dụng",
          status: false
      },
      {
          label: "Ngưng áp dụng",
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
  // RenderFilterRoomTypeCheckboxes
  filterByRoomType.forEach((e,i) => {
      let divTag = document.createElement("div");
      divTag.setAttribute("class", "boloc_item");
      divTag.innerHTML = `
          <input class="boloc_checkbox" type="checkbox"/>
          <span class="boloc_label">${e.label}</span>
      `
      divTag.addEventListener('change', function() {
        filterByRoomType[i].status = this.querySelector(".boloc_checkbox").checked;
          updateTable();
      });
      document.querySelector("#boloc_roomPrice_roomType").append(divTag);
      
  })
  // RenderFilterPriceTypeCheckboxes
  filterByPriceType.forEach((e,i) => {
      let divTag = document.createElement("div");
      divTag.setAttribute("class", "boloc_item"); 
      divTag.innerHTML = `
          <input class="boloc_checkbox" type="checkbox"/>
          <span class="boloc_label">${e.label}</span>
      `
      divTag.addEventListener('change', function() {
        filterByPriceType[i].status = this.querySelector(".boloc_checkbox").checked;
          updateTable();
      });
      document.querySelector("#boloc_roomPrice_price_type").append(divTag);
      
  })
  // RenderFilterAvailableCheckboxes
  filterByAvailable.forEach((e,i) => {
      let divTag = document.createElement("div");
      divTag.setAttribute("class", "boloc_item");
      divTag.innerHTML = `
          <input class="boloc_checkbox" type="checkbox"/>
          <span class="boloc_label">${e.label}</span>
      `
      divTag.addEventListener('change', function() {
        filterByAvailable[i].status = this.querySelector(".boloc_checkbox").checked;
          updateTable();
      });
      document.querySelector("#boloc_roomPrice_available").append(divTag);
      
  })

  
  for(let i=0; i<allRoomPrices.length; i++){
    allRoomPrices[i].addEventListener('click', function(){
          for (let previousSelectedRow of document.querySelectorAll(".row_selected")) {
              previousSelectedRow.classList.remove("row_selected");
          }
          selected_priceRoomID = allRoomPrices[i].querySelector(".roomPrice_row_id").innerHTML * 1;
          this.classList.add("row_selected");
          for(let i=0; i<allButtonNotClick.length; i++){
              allButtonNotClick[i].classList.remove("functionality_item");
              allButtonNotClick[i].classList.add("button_selected");
          }
      });
  }

  document.querySelector("#roomPrice_btn_edit").addEventListener('click', function(){
      if (selected_priceRoomID > 0) {
          window.location = `${window.location}/${selected_priceRoomID}/edit`;
      }
      
  });
  document.querySelector("#roomPrice_btn_show").addEventListener('click', function(){
      if (selected_priceRoomID > 0) {
          window.location = `${window.location}/${selected_priceRoomID}`;
      }
  });

  function isUsingFilterRoomType(){
      for(let i=0; i<filterByRoomType.length; i++){
          if(filterByRoomType[i].status) return true;
      }
      return false;
  }
  function isUsingFilterPriceType(){
      for(let i=0; i<filterByPriceType.length; i++){
          if(filterByPriceType[i].status) return true;
      }
      return false;
  }
  function isUsingFilterAvailable(){
      for(let i=0; i<filterByAvailable.length; i++){
          if(filterByAvailable[i].status) return true;
      }
      return false;
  }

  document.querySelector("#roomPrice_input_filter").addEventListener('input', function(e){
      filterByString = e.target.value;
      updateTable();
  });

  function updateTable(){
      let hasAtLeastOneMatchedRow = false;
      for(let i=0; i<allRoomPrices.length; i++){
          
          let tRow = allRoomPrices[i];
          let tColumnDate = tRow.querySelector(".roomPrice_row_date").innerHTML;
          let tColumnRoomType = tRow.querySelector(".roomPrice_roomTypeId").innerHTML * 1;
          let tColumnPriceType = tRow.querySelector(".roomPrice_roomPriceId").innerHTML * 1;
          let tColumnAvailable = tRow.querySelector("#roomPrice_availableId").innerHTML;
          let tColumnPrice = tRow.querySelector("#roomPrice_priceId").innerHTML * 1;

          if((!tColumnDate.toLowerCase().includes(filterByString.toLowerCase()) 
                && filterByString.length > 0)
                ||(((tColumnPrice < filterByPriceMin && filterByPriceMin > 0) || (tColumnPrice > filterByPriceMax && filterByPriceMax > 0)) )) {
                    tRow.classList.add("hide_row");
              
          }
          else if((!filterByRoomType[tColumnRoomType-1].status && isUsingFilterRoomType())
                  ||(!filterByPriceType[tColumnPriceType-1].status && isUsingFilterPriceType())
                  ||(!filterByAvailable[tColumnAvailable === "true" ? 0 : 1].status && isUsingFilterAvailable())
                  ){
                    //   console.log(!filterByAvailable[tColumnAvailable].status, "-" ,isUsingFilterAvailable())
              tRow.classList.add("hide_row");
          }
          else{
              tRow.classList.remove("hide_row");
              hasAtLeastOneMatchedRow = true;
          }
      }
      
      if (hasAtLeastOneMatchedRow) {
          document.querySelector("#roomPrice_row_empty").classList.add("hide_empty");
      }else{
          document.querySelector("#roomPrice_row_empty").classList.remove("hide_empty");
      }
  }