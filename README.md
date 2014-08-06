Found it dificult to find scripts that help archive JSTOR content. This is
surprising considering their sordid history in relation to Aarron Swartz.

These scripts do not download PDF content of privileged JSTOR users. For
that look elsewhere. Instead these scripts allow for archiving of articles
provided freely on a limited bases to public unprivileged users.
The shell script simply monitors your browser cache and copies GIF's
that match the JSTOR preview size (configurable) to a directory and then
generates a pdf and html index when interrupted. The included javascript
user script can be loaded in the browser (via greasemonkey or other user
script management extensions) and will emulate a click on the "next"
button of a JSTOR article so as to fill up the browser cache with the
articles contents.

# Use

Defaults are configured for Firefox browsers on Linux systems. For OSX change the ``CACHE_DIR`` path appropriately. 

1. Clone scripts
2. Install javascript user script in browser (greasemonkey or
   other manager). This is not required but it helps automate the cache
   fillup. Without it you have to manually click "next" on a JSTOR article
   in order to fill the cache
3. Execute the shell script with a "name" as an argument. It will monitor 
   ``CACHE_DIR`` for GIF's that match ``GIF_WIDTH`` and copy them into a 
   directory named ``<name>``
4. Open a JSTOR article in the browser
5. When all pages of the article have been viewed press "``ctrl+c``" in 
   the scripts execution window. PDF and HTML files will be created in 
   the ``<name>`` directory.
