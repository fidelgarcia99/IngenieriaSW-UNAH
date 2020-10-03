!(function (a) {
    a.fn.animatedModal = function (n) {
        function o() {
            m.css({ "z-index": e.zIndexOut }), e.afterClose();
        }
        function t() {
            e.afterOpen();
        }
        var i = a(this),
            e = a.extend(
                {
                    modalTarget: "animatedModal",
                    position: "fixed",
                    width: "100%",
                    height: "100%",
                    top: "0px",
                    left: "0px",
                    zIndexIn: "",
                    zIndexOut: "",
                    color: "#39BEB9",
                    opacityIn: "1",
                    opacityOut: "0",
                    animatedIn: "zoomIn",
                    animatedOut: "",
                    animationDuration: ".5s",
                    overflow: "auto",
                    beforeOpen: function () {},
                    afterOpen: function () {},
                    beforeClose: function () {},
                    afterClose: function () {},
                },
                n
            ),
            d = a(".close-" + e.modalTarget),
            s = a(i).attr("href"),
            m = a("body").find("#" + e.modalTarget),
            l = "#" + m.attr("id");
        m.addClass("animated"), m.addClass(e.modalTarget + "-off");
        var r = {
            position: e.position,
            width: e.width,
            height: e.height,
            top: e.top,
            left: e.left,
            "background-color": e.color,
            "overflow-y": e.overflow,
            "z-index": e.zIndexOut,
            opacity: e.opacityOut,
            "-webkit-animation-duration": e.animationDuration,
            "-moz-animation-duration": e.animationDuration,
            "-ms-animation-duration": e.animationDuration,
            "animation-duration": e.animationDuration,
        };
        m.css(r),
            i.click(function (n) {
                n.preventDefault(),
                    a("body, html").css({ overflow: "hidden" }),
                    s == l &&
                        (m.hasClass(e.modalTarget + "-off") && (m.removeClass(e.animatedOut), m.removeClass(e.modalTarget + "-off"), m.addClass(e.modalTarget + "-on")),
                        m.hasClass(e.modalTarget + "-on") &&
                            (e.beforeOpen(), m.css({ opacity: e.opacityIn, "z-index": e.zIndexIn }), m.addClass(e.animatedIn), m.one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", t)));
            }),
            d.click(function (n) {
                n.preventDefault(),
                    a("body, html").css({ overflow: "auto" }),
                    e.beforeClose(),
                    m.hasClass(e.modalTarget + "-on") && (m.removeClass(e.modalTarget + "-on"), m.addClass(e.modalTarget + "-off")),
                    m.hasClass(e.modalTarget + "-off") && (m.removeClass(e.animatedIn), m.addClass(e.animatedOut), m.one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", o));
            });
    };
})(jQuery);
