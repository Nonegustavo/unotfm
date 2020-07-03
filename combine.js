const fs = require('fs');
const watch = require('watch');

// Concatenate a list of files or directories into a single output file
var self = module.exports = function(input, outputPath, options) {

    var inputAllFiles = []; // List of only files, no directories

    // Set default configuration options
    if (typeof options === 'undefined') {
        var options = {};
    }
    options.delimeterBefore = options.delimeterBefore || '';
    options.delimeterAfter = options.delimeterAfter || '';
    options.watchDir = options.watchDir || 'src';

    // Start the watch process
    if (process.argv[2] == 'watch' && typeof currentlyWatching === 'undefined') {
        console.log('\x1b[32m%s\x1b[0m', 'Watching for changes...');
        currentlyWatching = true;
        return watch.watchTree('src', function (f, curr, prev) {
            self(input, outputPath, options);
        });
    }

    console.log('\x1b[32m%s\x1b[0m', 'Combining files...');

    // Blank the file to begin with
    fs.closeSync(fs.openSync(outputPath, 'w'));

    // Open the new output file
    var outputFile = fs.createWriteStream(outputPath, { flags: 'a' });

    // Iterate over each directory in the list and add them to the new list
    input.forEach(function(inputPath) {

        // Iterate over every file in a listed directory and add them to the final list
        if (fs.lstatSync(inputPath).isDirectory()) {

            var files = fs.readdirSync(inputPath)


            files.forEach(function(file) {
                if (fs.lstatSync(inputPath + '/' + file).isFile()) {
                    inputAllFiles.push(inputPath + '/' + file);
                }
            });


        // If the current file is valid, add it to the final list
        } else if (fs.lstatSync(inputPath).isFile()) {
            inputAllFiles.push(inputPath);
        }

    });

    // Iterate over the pre-processed final list and concatenate the files together
    inputAllFiles.forEach(function(inputPath, index) {

        // Insert a delimeter or header for the current file
        if (options.delimeterBefore.length>0 || options.delimeterAfter.length>0) {
            outputFile.write((index==0 ? '' : '\n\n') + options.delimeterBefore + inputPath + options.delimeterAfter + '\n\n');
        }

        var fileContents = fs.readFileSync(inputPath, 'utf8', function(err, data) {
            if (err) {
                console.log('\x1b[31m%s\x1b[0m', err);
                process.exit(1)
            }
            return data;
        });

        outputFile.write(fileContents+'\n');
        console.log('\tAdded ' + inputPath);

    });

    // Close the output file
    outputFile.end();
    console.log('\x1b[32m%s\x1b[0m', 'Finished combining!');
}