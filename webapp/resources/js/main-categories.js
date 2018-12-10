$(document).ready(function () {
    var categoriesShown = false;
    var categories = $("#main-categories .nav");
    var categoriesText = $("#main-categories .show-hide-categories").text();
    var maxItems = 6;
    hideOtherMenuItems(maxItems);
    categories.css("max-height","none");
    categories.css("opacity",1);

    $("#main-categories .show-hide-categories").on('click', function (e) {
        e.preventDefault();

        if (categoriesShown) {
            categoriesShown = false;
            categories.slideUp("fast");
            $(this).removeClass("shown");
            $(this).text(categoriesText);
        } else {
            categoriesShown = true;
            categories.slideDown("fast");
            $(this).addClass("shown");
            $(this).text("Свернуть список");
        }
    });

    $("#mainCategoriesDropdownMenuLink").on('click', function (e) {
        $(this).parent().toggleClass("rolledDown");
    });

});

function hideOtherMenuItems(maxItems) {
    var categoriesLi = $("#main-categories ul li.nav-item:not('.dropdown')");
    var moreItemsLi = $("#main-categories ul li.dropdown"); // крайний li
    if ($("#main-categories .nav").css("flex-direction") == "row") {
        if (categoriesLi.length > maxItems) {
            moreItemsLi.css("display", "list-item");
            var dropDownMenu = moreItemsLi.find(".dropdown-menu");
            $(categoriesLi).each(function (id, li) {
                if (id > maxItems-1) {
                    $(this).removeClass("nav-item").addClass("dropdown-item").appendTo(dropDownMenu);
                }

            });

        }
    }
}
