// ==UserScript==
    // @name          Linkify
    // @namespace     http://youngpup.net/userscripts
    // @description   Turn plain-linkstext URLstext URLs into linkshyperlinks
    // @include *
    // ==/UserScript==

    // based on code by Aaron Boodman
    // and included here with his gracious permission
    // kv: copied urlRegex from other project with aim of ccatching .com links
    // without https. It fails, though, because it opens them under current
    // domain. I'll have to see why.
    // The other one, on the other hand, doen't work on local pages (file://)

//   var urlRegex = /\b(https?:\/\/[^\s+\"\<\>]+)/ig;
var urlRegex = /\b(?![\@\s]+)((https?|nntp|news|telnet|irc|ftp):\/\/)?(([-.A-Za-z0-9]+:)?[\#-.A-Za-z0-9]+@)?((([\w-]+(?!@)\.)?([\w-]+\.)+(ru|pl|io|cc|tt|am|dk|com|net|org|se|no|nl|us|uk|de|it|nu|edu|info|co|in|to|fr|gov|biz|tv|mil|hu)(\.(nr|in|uk))?)|(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(about:\w+))(\/[^\s]*)?\b/gi, space_regex=/ /g, http_regex=/^((https?|nntp|news|telnet|irc|ftp)\:\/\/)|(about:\w+)/i, txt=/\.txt$/i;

    var snapTextElements = document.evaluate("//text()[not(ancestor::a) " + 
        "and not(ancestor::script) and not(ancestor::style) and " + 
        "contains(translate(., 'HTTP', 'http'), 'http')]", 
        document, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    for (var i = snapTextElements.snapshotLength - 1; i >= 0; i--) {
        var elmText = snapTextElements.snapshotItem(i);
        if (urlRegex.test(elmText.nodeValue)) {
            var elmSpan = document.createElement("span");
            var sURLText = elmText.nodeValue;
            elmText.parentNode.replaceChild(elmSpan, elmText);
            urlRegex.lastIndex = 0;
            for (var match = null, lastLastIndex = 0;
                 (match = urlRegex.exec(sURLText)); ) { 
                elmSpan.appendChild(document.createTextNode(
                sURLText.substring(lastLastIndex, match.index))); 
                var elmLink = document.createElement("a"); 
                elmLink.style.borderBottom = '1px dotted red';
                elmLink.setAttribute("href", match[0]); 
                elmLink.appendChild(document.createTextNode(match[0])); 
                elmSpan.appendChild(elmLink); 
                lastLastIndex = urlRegex.lastIndex;
            }
            elmSpan.appendChild(document.createTextNode(
                sURLText.substring(lastLastIndex)));
            elmSpan.normalize();
        }
    }
