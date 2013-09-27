// ==UserScript==
// @name          Dark Memrise
// @namespace     http://userstyles.org
// @description   Dark Memrise
// @author        Oscar SaborÃ­o-Romano
// @homepage      http://userstyles.org/styles/85811
// @include       http://memrise.com/*
// @include       https://memrise.com/*
// @include       http://*.memrise.com/*
// @include       https://*.memrise.com/*
// @include       http://www.memrise.com/*
// ==/UserScript==
(function() {
var css = "#page-head.vanilla, .full-width.alternate, html, body,\n    .mem-view{\n        background-image: none !important;\n    }\n    \n    * {\n        background-color: #222 !important;\n        \n        color: #cccccc !important ;\n        border-color: #3e3e3e !important;\n        text-shadow: none !important;\n    }\n\n    .garden-box.end_of_session .memstreamheader,\n    .thing-show .columns .show-more-link{\n        background-image: none !important;\n    }\n\n    h1.center{\n        color: black !important;\n    }\n    \n    #progress-bar .bar , #garden-timer, #circle{\n       background-color: rgb(23, 87, 37) !important;\n       color: #cccccc !important ;\n       border-color: white !important;\n       position: absolute !important;\n       top: 0px !important;\n    }\n       \n    .right-area\n    .circle,\n    .frontage,\n    .garden-timer,\n    .points animated,\n    .streak{\n        \n        background-color: transparent !important;\n        background-image: url(\"http://static.memrise.com/garden/img/ui/circle-frame@2x.png?17d8c9\") !important;\n        background-position: center !important;\n        background-repeat: no-repeat !important;\n        background-size: 100% auto !important;\n        \n        color: white !important;\n        \n        border-color: white !important;\n    }\n    \n    #sm2movie, .movieContainer sm2_debug flash_debug{\n        \n        background-color: transparent !important;\n        background-image: none !important;\n        background-position: center !important;\n        background-repeat: no-repeat !important;\n        background-size: 100% auto !important;\n        \n        color: transparent !important;\n        border-color: black !important;\n        opacity: 0 !important;\n        \n    }\n    \n    .btn-group{\n        opacity: 100 !important;\n    }\n\n\n    a:link  {\n        color: lightgrey !important ;\n    }\n\n    a:active {\n        color: #ffffff !important  ;\n    }\n\n\n    a:visited  {\n        color: #999999 !important ;\n    }\n\n\n    a:hover {\n        color: lightgrey !important;\n    }\n    \n    #page-head, .course-actions{\n        background-image: none !important;\n    }";
if (typeof GM_addStyle != "undefined") {
    GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
    PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
    addStyle(css);
} else {
    var node = document.createElement("style");
    node.type = "text/css";
    node.appendChild(document.createTextNode(css));
    var heads = document.getElementsByTagName("head");
    if (heads.length > 0) {
        heads[0].appendChild(node); 
    } else {
        // no head yet, stick it whereever
        document.documentElement.appendChild(node);
    }
}
})();
