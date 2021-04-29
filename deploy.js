var ghpages = require('gh-pages');

ghpages.publish('src', () => {
    console.log("Deployed");
});
