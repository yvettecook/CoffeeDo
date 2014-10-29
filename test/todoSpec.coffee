mongoose = require 'mongoose'
chai = require 'chai'
expect = chai.expect
Todo = require '../src/todo'

describe 'Todo', ->

	before ->
		mongoose.connect('mongodb://localhost/todosTest')

	it 'saves todos', (done) ->
		todo = new Todo {user_id: "bob", content: "learn mongo db" }
		todo.save (error, saved_todo) ->
			try
				expect( saved_todo.user_id ).to.eql "bob"
				done()
			catch error
				done(error)

