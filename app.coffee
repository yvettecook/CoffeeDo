express = require 'express'
mongoose = require 'mongoose'
require './src/todo.coffee'
Todo = mongoose.model "Todo" 

app = express()

app.set "port", process.env.PORT or 4000
app.set 'storage-uri',
	process.env.MONGOHQ_URL or
	process.env.MONGOLAB_URI or
	'mongodb://localhost/todos'
app.set('views', __dirname + '/views')
app.set 'view engine', 'ejs'

mongoose.connect app.get('storage-uri'), { db: { safe: true}}, (err) -> 
	console.log "Mongoose - connection error: " + err if err?
	console.log "Mongoose - connection OK"

require './src/todo'

app.get '/', (request, response) ->
	response.render "index"

app.listen app.get('port'), ->
	console.log "Listening on port #{app.get('port')}"

