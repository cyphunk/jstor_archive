// ==UserScript==
// @name        jstor_clicknext
// @namespace   www.jstor.org
// @downloadURL	https://github.com/cyphunk/jstor_archive/raw/master/jstor_clicknext.user.js
// @description view jstor article and auto click through to next pages
// @version     1
// @grant       none
// @include	http://www.jstor.org/discover/*
// ==/UserScript==

setTimeout("$('.next')[1].click()" , 5000);
