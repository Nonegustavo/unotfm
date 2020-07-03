const fs = require('fs');
const combine = require('./combine');
const luamin = require('luamin');

combine(

    // List of files and directories in order to be concatenated
    [
        'src/init.lua',
        'src/images.lua',
        'src/deck.lua',
        'src/chairs.lua',
        'src/rules.lua',
        'src/lights.lua',
        'src/card_tips.lua',
        'src/curses.lua',
        'src/medals.lua',
        'src/consumables.lua',
        'src/panels.lua',
        'src/translate.lua',
        'src/bots',
        'src/libs',
        'src/cards',
        'src/events',
        'src/ui',
        'src/main.lua'
    ],

    // Output file
    'unotfm.lua',

    // Optional parameters to alter behaviour
    {
        'delimeterBefore': '--[[ ',
        'delimeterAfter': ' ]]--'
    }
);


// Optionally minify the final output script using luamin
if (process.argv[2] == 'minify') {
    console.log('\x1b[32m%s\x1b[0m', 'Minifying script...\n');

    var fileContents = fs.readFileSync('unotfm.lua', 'utf8', function(err, data) {
        if (err) {
            console.log('\x1b[31m%s\x1b[0m', err);
            process.exit(1)
        }
        var originalFile = fs.createWriteStream('unotfm.lua', { flags: 'w' });
        var minified = luamin.minify(data)
        console.log('\x1b[32m%s\x1b[0m', '['+minified+']')
        originalFile.write(minified);
        originalFile.close();
    });

    console.log('\x1b[32m%s\x1b[0m', 'Finished minifying!\n');
}