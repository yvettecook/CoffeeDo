express = require 'express'

app = express()

app.set "port", process.env.PORT or 4000

app.get '/', (request, response) ->
	response.send "Hello world"

app.listen app.get('port'), ->
	console.log "Listening on port #{app.get('port')}"
