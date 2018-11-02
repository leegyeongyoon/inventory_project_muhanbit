	var xhttp;
	var reinventory_count =0;
	var getttttt = new Array() ;
	var macget = new Array();
	function createHttpRequest() {
		xhttp = new XMLHttpRequest();
	}
	
	function findproname(check) {
		createHttpRequest();
		xhttp.onreadystatechange = callFunction;
		var req = "day.jsp?category=" + check.value;
		xhttp.open("GET", req, true);
		xhttp.send(null);
	}
	function callFunction() {
		if (xhttp.readyState == 4) {
			if (xhttp.status == 200) {
				var responseData = xhttp.responseText;
				document.getElementById("product_name").innerHTML = null;
				document.getElementById("product_name").innerHTML = responseData;
			}
		}
	}
	
	function findinventory_state(check) {
		createHttpRequest();
		xhttp.onreadystatechange = callFunction2;
		var req = "findinventory_state.jsp?product_name=" + check.value;
		xhttp.open("GET", req, true);
		xhttp.send(null);
	}
	function callFunction2() {
		if (xhttp.readyState == 4) {
			if (xhttp.status == 200) {
				var responseData = xhttp.responseText;
				document.getElementById("product_state_table").innerHTML = null;
				document.getElementById("product_state_table").innerHTML = responseData;
			}
		}
	}
	
/*	function inventory_list() {
		alert(reinventory_count);
		var inventory_num = document.getElementById("inventory").value;
		var inventory = new Array();
		if (inventory_num > 1000 || inventory_num <= -1) {
			alert('재고량은 1개부터 1000개까지 입력이 가능합니다.');
			document.getElementById("inventory").focus();
			return;
		}

		//document.getElementById("serial_number").innerHTML = null;
		if((inventory_num-reinventory_count >=0)){
			for (var i = reinventory_count; i < inventory_num; i++) {
				document.getElementById("serial_number").innerHTML += "<input type='text' class='inventory'  name='inventory["
						+ i + "]' style='margin-right: 10px; margin-bottom:5px;'>";
				if (i % 5 == 4) {
					document.getElementById("serial_number").innerHTML += "<br>"
				}
			}
		}
		else if ((inventory_num-reinventory_count) < 0){
			for (var i = reinventory_count; i >=inventory_num ; i--) {
				$("input[name='inventory[" + i + "]']").remove();
				if (i % 4 == 0) {
					document.getElementById("serial_number").innerHTML += "<br>"
				}
			}
		}
		
		reinventory_count = inventory_num = document.getElementById("inventory").value;
	}
	*/
	
	function validation_check() {
		var inventory_num = document.getElementById("inventory").value
	
		for (var i = 0; i < inventory_num; i++) {
	
			if (!$("input[name='inventory[" + i + "]']").val()) {
	
				alert('입력되지 않은 시리얼 번호가 있습니다.');
				$("input[name='inventory[" + i + "]']").focus();
				return false;
			}
		}
	
		if (document.getElementById("product_name").value == "") {
			alert('물품명을 선택하지 않으셨습니다.')
			document.getElementById("product_name").focus();
			return false;
		}
	
		else if (document.getElementById("inventory").value == "") {
			alert('재고를 입력하지 않으셨습니다.')
			document.getElementById("inventory").focus();
			return false;
		}
	
		else if (document.getElementById("input_date").value == "") {
			alert('입고일을 입력하지 않으셨습니다.')
			document.getElementById("input_date").focus();
			return false;
		}
	
		else {
			document.getElementById("inventory_insertform").submit();
		}
	
	}
	
	function delete_validation_check() {
	
		var chk = false;
		var deliver = document.getElementsByName("deliver");
		for (var i = 0; i < deliver.length; i++) {
			if (deliver[i].checked == true) {
				chk = true;
				break;
			}
		}
		if (document.getElementById("deliver") == null) {
			alert('삭제하실 물건을 체크하지 않으셨습니다.')
	
			return false;
		}
	
		else if (!chk) {
			alert('삭제하실 물건을 체크하지 않으셨습니다.');
	
			return false;
		} else {
	
			var deliver = document.getElementsByName("deliver");
	
			for (var i = 0; i < deliver.length; i++) {
				if (deliver[i].checked == false) {
					document.getElementById(deliver[i].value).disabled = true;
				}
			}
	
			product_state_form.action = "inventory_delete_ok.jsp";
			product_state_form.submit();
		}
	
	}
	
	function choose_delete() {
		var chk = false;
		var choose_delect = document.getElementsByName("choose_delect");
		for (var i = 0; i < choose_delect.length; i++) {
			if (choose_delect[i].checked == true) {
				chk = true;
	
			} else if (choose_delect[i].checked == false) {
				chk = false;
	
			}
		}
		if (chk) {
	
			document.getElementById("product_name").disabled = true;
			return;
		}
	
		else {
			document.getElementById("product_name").disabled = false;
			return;
		}
	
	}
	
	function product_insert_validation_check() {
		if (document.getElementById("category2").value == ""
				&& document.getElementById("category").value == "nocategorychecked") {
			document.getElementById("category2").focus();
			alert('카테고리를 입력하여 주세요');
			return;
	
		} else if (document.getElementById("category2").value != ""
				&& document.getElementById("category").value != "nocategorychecked") {
			document.getElementById("category2").focus();
			alert('카테고리를 한개만 입력해주세요');
			return;
	
		}
	
		else if (document.getElementById("product_name").value == "") {
			document.getElementById("product_name").focus();
			alert('물건명을 입력하여 주세요');
			return;
	
		} else {
	
			if (document.getElementById("category2").value == ""
					&& document.getElementById("category").value != "nocategorychecked") {
				document.getElementById("category2").disabled = true;
	
			}
	
			else if (document.getElementById("category2").value != ""
					&& document.getElementById("category").value == "nocategorychecked") {
				document.getElementById("category").disabled = true;
	
			}
			document.getElementById("product_insertform").submit();
	
		}
	
	}
	
	function deliver() {
		var chk = false;
		var deliver = document.getElementsByName("deliver");
		for (var i = 0; i < deliver.length; i++) {
			if (deliver[i].checked == true) {
				chk = true;
				break;
			}
		}
		if (document.getElementById("deliver") == null) {
			alert('납품하실 물건을 체크하지 않으셨습니다.')
	
			return false;
		}
	
		else if (!chk) {
			alert('납품하실 물건을 체크하지 않으셨습니다.');
	
			return false;
		}
	
		else if (document.getElementById("output_date").value == "") {
			alert('출고일을 입력하지 않으셨습니다.')
			document.getElementById("output_date").focus();
			return false;
		}
	
		else {
	
			var deliver = document.getElementsByName("deliver");
			var mac_address = document.getElementsByName("mac_address");
	
			for (var i = 0; i < deliver.length; i++) {
				if (deliver[i].checked == false) {
					document.getElementById(deliver[i].value).disabled = true;
				    document.getElementById(mac_address[i].value).disabled = true;
				}
			}
	
			product_state_form.action = "deliver_ok.jsp";
			product_state_form.submit();
		}
		function inventory_delete() {
			var chk = false;
			var deliver = document.getElementsByName("deliver");
			for (var i = 0; i < deliver.length; i++) {
				if (deliver[i].checked == true) {
					chk = true;
					break;
				}
			}
			if (document.getElementById("deliver") == null) {
				alert('납품하실 물건을 체크하지 않으셨습니다.')
	
				return false;
			}
	
			else if (!chk) {
				alert('납품하실 물건을 체크하지 않으셨습니다.');
	
				return false;
			}
	
			else {
				product_state_form.action = "inventory_delete.jsp";
				product_state_form.submit();
			}
	
		}
	}
					
			
			function inventory_list() {
			
				
				var inventory_num = parseInt(document.getElementById("inventory").value);
				var inventory = new Array();
				var mac_address = new Array();
				var createtable = "";
				
				
					
					if(reinventory_count != 0){
						for(var i= 0 ; i<reinventory_count ; i++){
							
							getttttt[i] = document.getElementById("inventory["+i+"]").value;
							macget[i] = document.getElementById("mac_address["+i+"]").value;
							
						}
					}
				if (inventory_num > 1000 || inventory_num <= -1) {
					alert('재고량은 1개부터 1000개까지 입력이 가능합니다.');
					document.getElementById("inventory").focus();
					return;
				}
				
				document.getElementById("serial_number").innerHTML = null;
			
				for (var i = 0; i < inventory_num; i++) {
					
					if(i%3==0){
						
					createtable += "<tr><td width='150px'><input type='text'  autocomplete='off'  style ='width:150px;' class='inventory'  name='inventory["
							+ i + "]' id='inventory["+ i + "]'></td><td width='150px'><input type='text' autocomplete='off' class='mac_address' style ='width:150px;' name='mac_address["
							+ i + "]' id='mac_address["+ i + "]' ></td>";
					}
					else if(i%3 != 0 && i % 3 != 2){
						
						createtable += "<td width='150px'><input type='text' autocomplete='off' class='inventory' style ='width:150px;' name='inventory["
							+ i + "]' id='inventory["+ i + "]'  ></td><td width='150px'><input type='text' autocomplete='off' style ='width:150px;' class='mac_address'  name='mac_address["
							+ i + "]' id='mac_address["+ i + "]' ></td>";
					}
					else if (i % 3 == 2) {
						createtable += "<td width='150px'><input type='text' autocomplete='off' class='inventory' style ='width:150px;' name='inventory["
							+ i + "]' id='inventory["+ i + "]' ></td><td width='150px'><input type='text' autocomplete='off' style ='width:150px;' class='mac_address'  name='mac_address["
							+ i + "]' id='mac_address["+ i + "]' ></td></tr>";
						
					}
					
				}
				document.getElementById("serial_number").innerHTML 	= createtable;
				if(inventory_num >= reinventory_count){
					
				for(var i=0  ; i < reinventory_count; i++){
					document.getElementById("inventory["+i+"]").value = getttttt[i];
					document.getElementById("mac_address["+i+"]").value = macget[i];
				}
				}
				
				else if (inventory_num < reinventory_count){
					for(var i=0  ; i < inventory_num; i++){
						document.getElementById("inventory["+i+"]").value = getttttt[i];
						document.getElementById("mac_address["+i+"]").value = macget[i];
					}
				}
				reinventory_count  = document.getElementById("inventory").value;
			}
			
		
			
		
		
		
				function inventory_delete() {
					var chk = false;
					var deliver = document.getElementsByName("deliver");
					for (var i = 0; i < deliver.length; i++) {
						if (deliver[i].checked == true) {
							chk = true;
							break;
						}
					}
					if (document.getElementById("deliver") == null) {
						alert('납품하실 물건을 체크하지 않으셨습니다.')
			
						return false;
					}
			
					else if (!chk) {
						alert('납품하실 물건을 체크하지 않으셨습니다.');
			
						return false;
					}
			
					else {
						product_state_form.action = "inventory_delete.jsp";
						product_state_form.submit();
					}
			
				}
			

			function search_first_selete() {
				var first_selete = document.getElementById("first_selete").value;
				if(first_selete == "1"){
					document.getElementById("second_selete").innerHTML = "<option value='0'></option>"
					+"<option value='1'>물건이름</option>"
					+"<option value='2'>시리얼넘버</option>"
					+"<option value='3'>기타사항</option>"
					+"<option value='4'>MacAddress</option>"
					+"<option value='5'>입고일</option>";
														
				}else if(first_selete == "2"){
					document.getElementById("second_selete").innerHTML = "<option value='0'></option>"
						+"<option value='1'>물건이름</option>"
						+"<option value='2'>입고량</option>"
						+"<option value='3'>납품량</option>"
						+"<option value='4'>납품회사</option>"
						+"<option value='5'>입고일</option>"
						+"<option value='6'>납품일</option>";
						
					
				}else{
					document.getElementById("second_selete").innerHTML = null;
					
				}
			}
			
			function search_data_selete() {
				var first_selete = document.getElementById("second_selete").value;
				if(first_selete == "5" || first_selete == "6"){
					document.getElementById("search_data_input").innerHTML = "<input autocomplete='off' class='w3-input w3-border w3-hover-border-black'style='width: 100%;' type='date' name='search'>";
														
				}else if(first_selete != "5" && first_selete != "6"){
					document.getElementById("search_data_input").innerHTML = "<input autocomplete='off' class='w3-input w3-border w3-hover-border-black'style='width: 100%;' type='text' name='search'>"
				}else{
					document.getElementById("search_data_input").innerHTML = null;
					
				}
			}
		