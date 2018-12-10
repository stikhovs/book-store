$(document).ready(function () {
    var maxItemsInFooter = 6;
    hideOtherMenuItemsInFooter(maxItemsInFooter);
});

function hideOtherMenuItemsInFooter(maxItems) {
    var categoriesLi = $("footer ul li.nav-item:not('.dropup')");
    var moreItemsLi = $("footer ul li.dropup"); // крайний li
    if ($("footer .navbar-toggler").css("display") == "none") {
        if (categoriesLi.length > maxItems) {
            moreItemsLi.css("display", "list-item");
            var dropDownMenu = moreItemsLi.find(".dropdown-menu");
            $(categoriesLi).each(function (id, li) {
                if (id > maxItems - 1) {
                    $(this).removeClass("nav-item").addClass("dropdown-item").appendTo(dropDownMenu);
                }

            });

        }
    }
}
