p = require('../utils/printer')
assert = require('chai').assert
should = require('chai').should()
COLS = process.stdout.columns

#: Test Success Method

describe 'success()', ->
	it 'Return boolean', ->
		p.success('Test').should.be.a('boolean')
	it 'Return string', ->
		p.success('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.success('Test', { ret: true }).length.should.equal(COLS - 1)
	it 'Proper length with args', ->
		p.success('Test', { ret: true, dec: 'arrow', indent: 2 }).length.should.equal(COLS - 1)
	it 'Proper length without log', ->
		p.success('Test', { ret:true, log: false, dec: 'arrow', indent: 2 }).length.should.equal(COLS - 1)
	it 'Contains preset characters', ->
		assert.equal(p.success('Test', { ret: true }).indexOf('✔'), 0)

#: Test Info Method

describe 'info()', ->
	it 'Return boolean', ->
		p.info('Test').should.be.a('boolean')
	it 'Return string', ->
		p.info('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.info('Test', { ret: true }).length.should.equal(COLS)
	it 'Proper length with args', ->
		p.info('Test', { ret: true, dec: 'arrow', indent: 2 }).length.should.equal(COLS)
	it 'Proper length without log', ->
		p.info('Test', { ret:true, log: false, dec: 'arrow', indent: 2 }).length.should.equal(COLS)
	it 'Contains preset characters', ->
		assert.equal(p.info('Test', { ret: true }).indexOf('ℹ'), 0)

#: Test Warning Method

describe 'warning()', ->
	it 'Return boolean', ->
		p.warning('Test').should.be.a('boolean')
	it 'Return string', ->
		p.warning('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.warning('Test', { ret: true }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1)
	it 'Proper length with args', ->
		p.warning('Test', { ret: true, dec: 'arrow', indent: 2 }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1)
	it 'Proper length without log', ->
		p.warning('Test', { ret:true, log: false, dec: 'arrow', indent: 2 }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1)
	it 'Contains preset characters', ->
		assert.equal(p.warning('Test', { ret: true }).indexOf('⚠'), 0)

#: Test Error Method

describe 'error()', ->
	it 'Return boolean', ->
		p.error('Test').should.be.a('boolean')
	it 'Return string', ->
		p.error('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.error('Test', { ret: true }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS)
	it 'Proper length with args', ->
		p.error('Test', { ret: true, dec: 'arrow', indent: 2 }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS)
	it 'Proper length without log', ->
		p.error('Test', { ret:true, log: false, dec: 'arrow', indent: 2 }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS)
	it 'Contains preset characters', ->
		assert.equal(p.error('Test', { ret: true }).indexOf('💀'), 0)

#: Test Arrow Method

describe 'arrow()', ->
	it 'Return boolean', ->
		p.arrow('Test').should.be.a('boolean')
	it 'Return string', ->
		p.arrow('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.arrow('Test', { ret: true }).length.should.equal(COLS)
	it 'Proper length with args', ->
		p.arrow('Test', { ret: true, indent: 2 }).length.should.equal(COLS)
	it 'Proper length without log', ->
		p.arrow('Test', { ret:true, log: false, indent: 2 }).length.should.equal('-->         Test'.length)
	it 'Contains preset characters', ->
		assert.equal(p.arrow('Test', { ret: true }).indexOf('-->'), 0)

#: Test Chevron Method

describe 'chevron()', ->
	it 'Return boolean', ->
		p.chevron('Test').should.be.a('boolean')
	it 'Return string', ->
		p.chevron('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.chevron('Test', { ret: true }).length.should.equal(COLS)
	it 'Proper length with args', ->
		p.chevron('Test', { ret: true, indent: 2 }).length.should.equal(COLS)
	it 'Proper length without log', ->
		p.chevron('Test', { ret:true, log: false, indent: 2 }).length.should.equal('>>>         Test'.length)
	it 'Contains preset characters', ->
		assert.equal(p.chevron('Test', { ret: true }).indexOf('>>>'), 0)

#: Test Bullet Method

describe 'bullet()', ->
	it 'Return boolean', ->
		p.bullet('Test').should.be.a('boolean')
	it 'Return string', ->
		p.bullet('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.bullet('Test', { ret: true }).length.should.equal(COLS)
	it 'Proper length with args', ->
		p.bullet('Test', { ret: true, indent: 2 }).length.should.equal(COLS)
	it 'Proper length without log', ->
		p.bullet('Test', { ret:true, log: false, indent: 2 }).length.should.equal('•         Test'.length)
	it 'Contains preset characters', ->
		assert.equal(p.bullet('Test', { ret: true }).indexOf('•'), 0)

#: Test Log Method

describe 'log()', ->
	it 'Return boolean', ->
		p.log('Test').should.be.a('boolean')
	it 'Return string', ->
		p.log('Test', { ret: true }).should.be.a('string')
	it 'Proper length', ->
		p.log('Test', { ret: true }).length.should.equal(COLS)
	it 'Proper length with emoji', ->
		p.log('Test', { ret: true, emoji: 'smile' }).length.should.equal(COLS)
	it 'Contains text', ->
		assert.equal(p.log('Test', { ret: true }).indexOf('Test'), 0)

#: Test Title Box Method

describe 'titleBox()', ->
	it 'Return boolean', ->
		p.titleBox('Title').should.be.a('boolean')
	it 'Return string', ->
		p.titleBox('Title', { ret: true }).should.be.a('string')

#::: End Program :::