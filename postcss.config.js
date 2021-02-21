const fs = require('fs')
const path = require('path')

const purgecss = require('@fullhuman/postcss-purgecss')

function getHTMLFiles(dir) {
    let results = []
    let list = fs.readdirSync(dir)

    list.forEach(function(file) {
        filePath = path.join(dir, file)
        var stats = fs.statSync(filePath)
        if (stats && stats.isDirectory()) {
            // Recurse into a subdirectory
            results = results.concat(getHTMLFiles(filePath))
        }

        if (filePath.endsWith('.html')) {
            // Is a file
            results.push(filePath)
        }
    })
    return results
}

module.exports = {
    plugins: {
        '@fullhuman/postcss-purgecss': {
            // Note that for this to work, it needs to be run after hugo builds everything.
            // When using "serve", we can use "--destination public".
            // In the HTML files, we can use https://gohugo.io/hugo-pipes/postprocess/
            content: getHTMLFiles('public')
        },
        'cssnano': {
            preset: 'default'
        }
    }
};
