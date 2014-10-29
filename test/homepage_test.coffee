expect = require('chai').expect
mongoose = require 'mongoose'
Browser = require('zombie')

describe 'the homepage', ->
	
	browser = null 

	before ->
		browser = new Browser {
			site: 'http://localhost:4000'
		}

	beforeEach (done) ->
		browser.visit '/', done

	it "has the heading ToDo List", ->
		expect(browser.text('h1')).to.eq "ToDo List" 