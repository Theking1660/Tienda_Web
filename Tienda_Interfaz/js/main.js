document.addEventListener("DOMContentLoaded", Categoria);
function init(){
    Categoria();
    Pagina();
}
(function ($) {
    "use strict";
    
    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Vendor carousel
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:2
            },
            576:{
                items:3
            },
            768:{
                items:4
            },
            992:{
                items:5
            },
            1200:{
                items:6
            }
        }
    });


    // Related carousel
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:2
            },
            768:{
                items:3
            },
            992:{
                items:4
            }
        }
    });


    // Product Quantity
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });
    
})(jQuery);

// Animation checkout
function showAnimation() {
    var animationContainer = document.querySelector('.animation-container');
    animationContainer.classList.add('show-animation');
    setTimeout(function () {
        animationContainer.classList.remove('show-animation');
    }, 2000);
}


function RedirigirL() {
    window.location.href="/Login/login.html";
}
function RedirigirC() {
    window.location.href = "/Register/register.html";
}
async function Categoria() {
    const api = "https://localhost:7266/api/";

    let id = "Categoria-";
    if (window.location.href == 'http://localhost:44575/index.html' || window.location.href == 'http://localhost:44575/' ) {
        for (let i = 1; i < 13; i++) {
            var response = await fetch((api + "Categoria/" + i), {
                "method": 'get',
                "headers": {
                    "Content-Type": 'application/json'
                }
            });
            var resultado = await response.json();
            for (item of resultado) {
                document.getElementById(id + i).textContent = item.categoria;

            }
        }
    }
    var response = await fetch(api + "Categoria", {
        method: 'get',
        "headers": {
            "Content-Type": 'application/json'
        }
    });
    var html = '';
    var resultado = await response.json();
    for (item of resultado) {
        var row = `<div class="nav-item dropdown dropright">
                            <a onclick="Productos_Categoria(${item.categoria},${false})" class="nav-link dropdown-toggle" data-toggle="dropdown">${item.categoria} <i class="fa fa-angle-right float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">`;

                            var response_2 = await fetch((api + "Subcategoria/" + item.categoria_id), {
            "method": 'get', 
            "headers": { 
                "Content-Type": 'application/json' }

        });
        var resultado_2 = await response_2.json();
        for (item_2 of resultado_2) {
            row = row + `<a href="" class="dropdown-item">${item_2.subcategoria}</a>`
        }
        html = html + row+'</div>'+'</div>';
    }
    document.getElementById("Cate").outerHTML = html;
}

function Productos_Categoria(Ids,tipos)
{
    window.location.href = "/shop.html";
    ID = Ids;
    TIpo = tipos;
}

let ID, Tipo;

async function Detalles(ID,tipo){

}






