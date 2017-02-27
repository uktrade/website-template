#!/usr/bin/env node
const fs = require('fs-extra')

var argv = process.argv.slice(2)
var assetCacheFolder = argv[0]

fs.copy('./src/img', './build/assets/img', err => {
  if (err) return console.error(err)
  console.log("success!")
});