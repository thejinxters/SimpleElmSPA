Simple Elm Single Page Application
==================================

This simple Elm application loads a very simple un-styled website with
navigation and text page content, running as a Single Page Application.
This means that as you navigate between pages, it does not actually
reload the browser, but rather updates the content, url, and title of the
page.

This is done by using Elm's `Browser.application` to intercept url changes
and clicked links and simply load new content instead of reloading the page.


### Run Locally
This repo uses yarn, npm, and parcel to build a auto-reloading
web server.

To get things spun up, just run:
``` bash
yarn run dev
```

### Building
When you run the following command, a folder called `dist` will be
created with a compiled/minified version of the code:
```
yarn run build
```
