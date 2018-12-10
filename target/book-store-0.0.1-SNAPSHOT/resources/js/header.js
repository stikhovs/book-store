function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

$(document).ready(function () {
    $("#search-button").hover(function () {
        $("#header .search-background").toggleClass("hovered");
    });

    var isShown = false;

    $("#dots .show-block").on('click', function (e) {
        e.preventDefault();

        if (isShown) {
            isShown = false;
            $("#signIn-cart-min").slideUp();
        } else {
            isShown = true;
            $("#signIn-cart-min").slideDown();
        }
    });


    $(document).mouseup(function (e) { // событие клика по веб-документу
        var div = $("#dots"); // тут указываем ID элемента
        if (!div.is(e.target) // если клик был не по нашему блоку
            &&
            div.has(e.target).length === 0) { // и не по его дочерним элементам
            if (isShown) {
                isShown = false;
                $("#signIn-cart-min").slideUp(); // скрываем его
            }


        }


    });
    
    
    $("#header").sticky({topSpacing:0});
    
    
    var sum = $("#header .cart .sum .sum-numeric").first().text();
    var sumNumeric = parseInt(sum,10);
    var cartBadge = $("#header .cart .cart-items .badge").first();
    
   console.log(sum);
   console.log(sumNumeric);
    
    var objectsInCart = parseInt(cartBadge.text().trim(),10);
    
      
    $(".btn-buy").on("click", function(e) {
    	e.preventDefault();
    	console.log("Click");
    	var price = $(this).parent().parent().find(".price-sum").text().trim();
    	
    	price = price.replace(/\s/g,""); // убираем пробелы внутри цены    	
    	console.log(price);
    	var priceNumeric = parseInt(price,10);
    	console.log(priceNumeric);
    	objectsInCart++;
		
    	$("#header .cart .cart-items .badge").each(function(index) {
			$(this).text(objectsInCart);
		});
		
		sumNumeric += priceNumeric;
		$("#header .cart .sum .sum-numeric").each(function(index) {
			$(this).text(sumNumeric);
		});
		console.log(sumNumeric);
		setCookie("totalItemsInCart", objectsInCart, 2);
		setCookie("totalSum", sumNumeric, 2); 
		
		var booksInCart = getCookie("booksInCart");
		
		//booksInCart.push($(this).attr("data-productid"));
		booksInCart += "ID" + $(this).attr("data-productid");
		//$("#booksInCart").text(booksInCart);
		setCookie("booksInCart",booksInCart,2);
		console.log(booksInCart);
		
		$(this).text("В корзине");
		$(this).removeClass("btn-success btn-buy");
		$(this).addClass("book-in-cart-btn disabled");
	});
    

});
