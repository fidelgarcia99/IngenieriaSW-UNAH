
(function($) {

    "use strict";

    jQuery(document).on("ready", function() {



        /*
         * -----------------------------------------------------------------
         *---------------------------Preloader and Anchor Tag---------------
         * -----------------------------------------------------------------
         */

        var themeWindow = $(window);
        var pagebody = $('html, body');
        themeWindow.on("load", function() {

            var preloader = jQuery('.preloader');
            var preloaderArea = jQuery('.preloader-area');
            preloader.fadeOut();
            preloaderArea.delay(200).fadeOut('slow');
            themeWindow.scrollTop(0);
        });

        var anchor = $('a[href="#"]');
        anchor.on("click", function() {
            e.preventDefault();
        });


        /*
         * -----------------------------------------------------------------
         *-------------------single-page-nav-plugin------------------------
         * -----------------------------------------------------------------
         */



        // Prevent console.log from generating errors in IE for the purposes of the demo
        if(!window.console) console = {
            log: function() {}
        };

        // The actual plugin
        if($(".seccion1-area").is("#seccion1-area")) {
            var singleNav = jQuery('.single-page-nav');
            singleNav.singlePageNav({
                offset: singleNav.outerHeight(),
                filter: ':not(.external)',
                updateHash: false
            });



            /*
             * -----------------------------------------------------------------
             *----------------------Contact form ajax---------------------------
             * -----------------------------------------------------------------
             */



            var contactSubmit = $('#contact-submit');

            contactSubmit.on('click', function(e) {
                e.preventDefault();
                var name = $('#form-name').val();
                var email = $('#form-email').val();
                var subject = $('#form-subject').val();
                var message = $('#form-message').val();
                var form = new Array({
                    'name': name,
                    'email': email,
                    'subject': subject,
                    'message': message
                });
                $.ajax({
                    type: 'POST',
                    url: "contact.php",
                    data: ({
                        'action': 'contact',
                        'form': form
                    })
                }).done(function(data) {

                    var conResult = $('#contact .result');
                    conResult.html(data);
                    $(".contact-form-area")[0].reset();

                });

            });


            /*
             * -----------------------------------------------------------------
             *-----------------------------Typed Js-----------------------------
             * -----------------------------------------------------------------
             */

            if($(".seccion1-area").is(".animated-text")) {
                var typed = new Typed("#typed", {
                    stringsElement: '#typed-strings',
                    typeSpeed: 60,
                    backSpeed: 30,
                    backDelay: 2000,
                    startDelay: 1000,
                    loop: true

                });
            }

        }
        /*
         * -----------------------------------------------------------------
         *----------------------- Pagepiling.js------------------------------
         * -----------------------------------------------------------------
         */


        var pagepiling = $('#pagepiling');
        pagepiling.pagepiling({
            menu: '#mainMenu',
            direction: 'vertical',
            verticalCentered: true,
            sectionsColor: [],
            anchors: ['home', 'seccion2', 'seccion3', 'seccion4', 'seccion5', 'seccion6', 'seccion7', 'seccion8', 'contact'],
            scrollingSpeed: 700,
            easing: 'swing',
            loopBottom: true,
            loopTop: true,
            css3: true,
            navigation: {
                'textColor': '#000',
                'bulletsColor': '#000',
                'position': 'right'
            },
            normalScrollElements: null,
            normalScrollElementTouchThreshold: 5,
            touchSensitivity: 5,
            keyboardScrolling: true,
            sectionSelector: '.section',
            animateAnchor: true,

            //events
            afterRender: function() {},
            afterLoad: function(anchorLink, index) {}
        });

        /*
         * -----------------------------------------------------------------
         *----------------------- header info bar---------------------------
         * -----------------------------------------------------------------
         */


        var headerInfo = $("#header-info-btn");

        headerInfo.animatedModal({
            modalTarget: 'header-info-bar',
            animatedIn: 'fadeInRight',
            animatedOut: 'fadeOutRight',
        });

        /*
         * -----------------------------------------------------------------
         *-------------------------Vanta.js---------------------------------
         * -----------------------------------------------------------------
         */

        if($(".vanta-bg").is(".bird")) {
            VANTA.BIRDS({
                el: "#seccion1-vanta-area",
                backgroundColor: 0xc0baa6,
                color1: 0x0,
                color2: 0x0,
                colorMode: "lerp",
                wingSpan: 14.00,
                separation: 59.00,
                cohesion: 17.00,
                quantity: 3.00,
                backgroundAlpha: 0.00
            })

        }
        if($(".vanta-bg").is(".fog")) {
            VANTA.FOG({
                el: "#seccion1-vanta-area",
                highlightColor: 0x9ec8e6,
                midtoneColor: 0x979acf,
                baseColor: 0x141414,
                blurFactor: 0.61,
                speed: 2.60
            })
        }

        if($(".vanta-bg").is(".waves")) {
            VANTA.WAVES({
                el: "#seccion1-vanta-area",
                color: 0x19303e,
                zoom: 1.22
            })
        }

        if($(".vanta-bg").is(".cloud")) {
            VANTA.CLOUDS({
                el: "#seccion1-vanta-area",
                skyColor: 0x1a1d34,
                cloudColor: 0x5e697a,
                cloudShadowColor: 0xb1020
            })
        }

    });

})(jQuery);