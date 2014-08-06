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

1. ``git clone https://github.com/cyphunk/jstor_archive.git``
2. Install Javascript userscript via User Script manager (such as grease 
   monkey) or directly if your browser supports it by accessing the raw 
   [jstor_clicknext.user.js](https://github.com/cyphunk/jstor_archive/raw/master/jstor_clicknext.user.js).
3. ``cd jstor_archive`` and ``./cache_monitor.sh EXAMPLE_NAME`` where ``EXAMPLE_NAME`` is the directory to be created within the current directory for storing GIF's. This name will also be used as the name for the PDF and HTML indexes that will be created later.
4. If the monitored ``CACHE_DIR`` shown on execution is different from that of your 
   browser (tested with Linux Firefox) change the ``CACHE_DIR`` enviornment
   variable and execute again.
5. Open a JSTOR article in your browser.
6. When all pages of the article have been viewed, either by manually
   clicking through each page or by letting the ``jstor_clicknext.user.js``
   user script do it, press "``ctrl+c``" in the scripts.
   PDF and HTML files will be created in the ``EXAMPLE_NAME`` directory.
