const express = require('express')
const app = express()

app.use(express.static('dist'))

app.get('/', async (req, res) => {
  res.sendFile(__dirname + '/index.html')
})

app.listen(3001)
