p = require('../utils/printer')
assert = require('chai').assert
should = require('chai').should()
COLS = process.stdout.columns

#: Replace ANSI Escape Characters

escRepl = (text) ->
	return text.replace(/\u001b\[.*?m/g, '')

#: Test Preset Methods

presetTest = (func, presetChar, offset=0) ->
	it 'Return boolean', ->
		func.bind(p)('Test').should.be.a('boolean')
	it 'Return string', ->
		func.bind(p)('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		escRepl(func.bind(p)('Test', { ret: true })).length.should.equal(COLS - offset)
	it 'Proper length - multiline string', ->
		(escRepl(func.bind(p)('Test '.repeat(100), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length - timestamp overlap', ->
		(escRepl(func.bind(p)('*'.repeat(process.stdout.columns - 3), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length with args', ->
		escRepl(func.bind(p)('Test', { ret: true, dec: 'arrow', indent: 2 })).length.should.equal(COLS - offset)
	it 'Proper length without log', ->
		escRepl(func.bind(p)('Test', { ret:true, log: false, dec: 'arrow', indent: 2 })).length.should.equal(COLS - offset)
	it 'Proper length without log - timestamp overlap', ->
		(escRepl(func.bind(p)('*'.repeat(process.stdout.columns - 3),
			{ ret:true, log: false, dec: 'arrow', indent: 2 })).length % COLS).should.equal(0)
	it 'Contains preset characters', ->
		assert.equal(func.bind(p)('Test', { ret: true }).indexOf(presetChar), 0)

#: Test Syle Methods

styleTest = (func, styleChar) ->
	it 'Return boolean', ->
		func.bind(p)('Test').should.be.a('boolean')
	it 'Return string', ->
		func.bind(p)('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		escRepl(func.bind(p)('Test', { ret: true })).length.should.equal(COLS)
	it 'Proper length - multiline string', ->
		(escRepl(func.bind(p)('Test '.repeat(100), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length - timestamp overlap', ->
		(escRepl(func.bind(p)('*'.repeat(process.stdout.columns - 3), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length with args', ->
		escRepl(func.bind(p)('Test', { ret: true, indent: 2 })).length.should.equal(COLS)
	it 'Proper length without log', ->
		escRepl(func.bind(p)('Test', { ret:true, log: false, indent: 2 })).length.should.equal("#{styleChar}         Test".length)
	it 'Proper length without log - timestamp overlap', ->
		escRepl(func.bind(p)('*'.repeat(process.stdout.columns * 2 - 3),
			{ ret:true, log: false, indent: 2 })).length.should.equal("#{styleChar}         #{'*'.repeat(process.stdout.columns * 2 - 3)}".length)
	it 'Contains preset characters', ->
		assert.equal(func.bind(p)('Test', { ret: true }).indexOf(styleChar), 0)

#: Test Success Method

describe 'success()', ->
	presetTest(p.success, '✔', 1)

#: Test Info Method

describe 'info()', ->
	presetTest(p.info, 'ℹ', 0)

#: Test Warning Method

describe 'warning()', ->
	presetTest(p.warning, '⚠', 1)

#: Test Error Method

describe 'error()', ->
	presetTest(p.error, '💀', 0)

#: Test Arrow Method

describe 'arrow()', ->
	styleTest(p.arrow, '-->')

#: Test Chevron Method

describe 'chevron()', ->
	styleTest(p.chevron, '>>>')

#: Test Bullet Method

describe 'bullet()', ->
	styleTest(p.bullet, '•')

#: Test Log Method

describe 'log()', ->
	it 'Return boolean', ->
		p.log('Test').should.be.a('boolean')
	it 'Return string', ->
		p.log('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		escRepl(p.log('Test', { ret: true })).length.should.equal(COLS)
	it 'Proper length - multiline string', ->
		(escRepl(p.log('Test '.repeat(100), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length - timestamp overlap', ->
		(escRepl(p.log('*'.repeat(process.stdout.columns - 3), { ret: true })).length % COLS).should.equal(0)
	it 'Proper length with emoji', ->
		escRepl(p.log('Test', { ret: true, emoji: 'smile' })).length.should.equal(COLS)
	it 'Contains text', ->
		assert.equal(p.log('Test', { ret: true }).indexOf('Test'), 0)

#: Test Title Box Method

describe 'titleBox()', ->
	it 'Return boolean', ->
		p.titleBox('Title').should.be.a('boolean')
	it 'Return string', ->
		p.titleBox('Title', { ret: true }).should.be.a('string')

#::: End Program :::