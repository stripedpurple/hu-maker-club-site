document.addEventListener("DOMContentLoaded", function () {
    "use strict";
    
    function apply(functions, selector) {
        var i, l, data, elements = document.querySelectorAll(selector);
        for (i = 0, l = elements.length; i < l; i += 1) {
            for (data in elements[i].dataset) {
                if (elements[i].dataset.hasOwnProperty(data)) {
                    if (typeof functions[data] === "function") {
                        functions[data].call(elements[i], elements[i].dataset[data]);
                    } else {
                        console.warn("unhandled data instruction " + data);
                    }
                }
            }
        }
    }

    apply({
        append: function (text) {
            this.appendChild(document.createTextNode(text));
        }
    }, "p")
});