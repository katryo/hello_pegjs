PEG = require('../lib/peg');
fs = require('fs');
parser = PEG.buildParser(fs.readFileSync('scratch.pegjs').toString());
console.log(parser.parse('aaaa[page]bbbb[bg park]cccc[se lion]ddd[bg house]eee[se person]'));
