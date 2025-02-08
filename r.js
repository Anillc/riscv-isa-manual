fs = require('fs')

const file = fs.readFileSync(process.argv[2]).toString()

const r = file.replaceAll(/\n(.+)::\n*\[/g, (_, p) => `\n${p}::\nxxx\n\n[`)
fs.writeFileSync(process.argv[2], r)