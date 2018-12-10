$(document).ready(function () {

    var menuMobile = $('#main-block .categories');
    var leftPosition = $('#main-block .categories').css("left");
    var isShown = false;

    $('#nav-burger').click(function () {
        
        if (isShown) {
            isShown = false;
            $(this).toggleClass('open');
            menuMobile.css("left", leftPosition);            
        } else {
            isShown = true;
            $(this).toggleClass('open');
            menuMobile.css("left", 0);
        }
    });
    
    $(document).mouseup(function (e) { // событие клика по веб-документу
        var div = $("#nav-burger"); // тут указываем ID элемента
        if (!div.is(e.target) // если клик был не по нашему блоку
            &&
            div.has(e.target).length === 0) { // и не по его дочерним элементам
            if (isShown) {
                isShown = false;
                div.toggleClass('open');
                menuMobile.css("left", leftPosition); // скрываем его
            }

        }
    });
});
