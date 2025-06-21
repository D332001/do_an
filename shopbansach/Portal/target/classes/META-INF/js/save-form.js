var Shop = {
		
		getUrlParameter: function(sParam) {
			var sPageURL = window.location.search.substring(1),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;
		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');
	
		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		},
		
		homePrevious: function(baseUrl) {
			var currentPage = parseInt(Shop.getUrlParameter("page"));
			window.location = baseUrl + "?page="+(currentPage-1);
		},
		
		homeNext: function(baseUrl) {
			var currentPage = parseInt(Shop.getUrlParameter("page"));
			window.location = baseUrl + "?page="+(currentPage+1);
		},
		
		addItemToCart: function(productId, quantity) {
			var data = {
					"productId": productId,
					"quantity": quantity
			};
			$.ajax({
				url: "/cart/mua-hang",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					$("#btnCheckout").html("Giỏ hàng("+jsonResult.data+")");
					$('html, body').animate({
						scrollTop: $("#btnCheckout").offset().top - 100
					}, 1000);
				}
			});
		},
		
		saveContact: function() {
			var data = {};
			data["firstName"] = $("#fname").val();
			data["lastName"] = $("#lname").val();
			data["subject"] = $("#sub").val();
			
			$.ajax({
				url: "/save-contact-with-ajax",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					//alert(jsonResult.message);
					//$("#message").html(jsonResult.data);
					//$('#blogModal').modal('show');
					if(jsonResult.status == 200) {
						alert('thanh cong');
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
}