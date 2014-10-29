mongoose = require 'mongoose'
Schema = mongoose.Schema

todoSchema = new Schema(
	user_id : String
	content : String
)

module.exports = mongoose.model('Todo', todoSchema)