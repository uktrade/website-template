#!/usr/bin/env node
const fs = require('fs-extra')

var argv = process.argv.slice(2)
var vendor_output = argv[0]

console.log("XXXXX", vendor_output)

fs.copy('./src/vendor', vendor_output, err => {
  if (err) return console.error(err)
  console.log("success!")
});