var PEG = require('./node_modules/pegjs/lib/peg');
var fs = require('fs');
var parser = PEG.buildParser(fs.readFileSync('hello.pegjs').toString());
var target = fs.readFileSync('target.txt').toString();
console.log(parser.parse(target));
