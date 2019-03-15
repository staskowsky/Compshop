/* ### sticky menu ### */
$(window).scroll(function () {
    if (parseInt($(document).scrollTop()) > 100) {
        $(".toStick").addClass("stickyMenu");
    } else {
        $(".toStick").removeClass("stickyMenu");
    }
});

/* ### scroll-up button ### */
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.scrollTop').fadeIn(500);
        } else {
            $('.scrollTop').fadeOut(500);
        }
    });

    $('.scrollTop').click(function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });


function validateForm() {
    let firstVar = document.forms["validatedForm"]["firstInput"].value;
    let secondVar = document.forms["validatedForm"]["secondInput"].value;
    if (firstVar != secondVar) {
        alert("Podane hasła różnią się od siebie.");
        return false;
    }
}
function emptyBasket() {
    alert("Nie można złożyć zamówienia z pustym koszykiem!\n" +
        "Dodaj produkty do koszyka i spróbuj ponownie.");
    return false;
}
