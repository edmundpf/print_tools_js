var COLS, assert, p, should;

p = require('../utils/printer');

assert = require('chai').assert;

should = require('chai').should();

COLS = process.stdout.columns;

//: Test Success Method
describe('success()', function() {
  it('Return boolean', function() {
    return p.success('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.success('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.success('Test', {
      ret: true
    }).length.should.equal(COLS - 1);
  });
  it('Proper length with args', function() {
    return p.success('Test', {
      ret: true,
      dec: 'arrow',
      indent: 2
    }).length.should.equal(COLS - 1);
  });
  it('Proper length without log', function() {
    return p.success('Test', {
      ret: true,
      log: false,
      dec: 'arrow',
      indent: 2
    }).length.should.equal(COLS - 1);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.success('Test', {
      ret: true
    }).indexOf('✔'), 0);
  });
});

//: Test Info Method
describe('info()', function() {
  it('Return boolean', function() {
    return p.info('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.info('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.info('Test', {
      ret: true
    }).length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return p.info('Test', {
      ret: true,
      dec: 'arrow',
      indent: 2
    }).length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return p.info('Test', {
      ret: true,
      log: false,
      dec: 'arrow',
      indent: 2
    }).length.should.equal(COLS);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.info('Test', {
      ret: true
    }).indexOf('ℹ'), 0);
  });
});

//: Test Warning Method
describe('warning()', function() {
  it('Return boolean', function() {
    return p.warning('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.warning('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.warning('Test', {
      ret: true
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1);
  });
  it('Proper length with args', function() {
    return p.warning('Test', {
      ret: true,
      dec: 'arrow',
      indent: 2
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1);
  });
  it('Proper length without log', function() {
    return p.warning('Test', {
      ret: true,
      log: false,
      dec: 'arrow',
      indent: 2
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS - 1);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.warning('Test', {
      ret: true
    }).indexOf('⚠'), 0);
  });
});

//: Test Error Method
describe('error()', function() {
  it('Return boolean', function() {
    return p.error('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.error('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.error('Test', {
      ret: true
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return p.error('Test', {
      ret: true,
      dec: 'arrow',
      indent: 2
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return p.error('Test', {
      ret: true,
      log: false,
      dec: 'arrow',
      indent: 2
    }).replace(/\u001b\[.*?m/g, '').length.should.equal(COLS);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.error('Test', {
      ret: true
    }).indexOf('💀'), 0);
  });
});

//: Test Arrow Method
describe('arrow()', function() {
  it('Return boolean', function() {
    return p.arrow('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.arrow('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.arrow('Test', {
      ret: true
    }).length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return p.arrow('Test', {
      ret: true,
      indent: 2
    }).length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return p.arrow('Test', {
      ret: true,
      log: false,
      indent: 2
    }).length.should.equal('-->         Test'.length);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.arrow('Test', {
      ret: true
    }).indexOf('-->'), 0);
  });
});

//: Test Chevron Method
describe('chevron()', function() {
  it('Return boolean', function() {
    return p.chevron('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.chevron('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.chevron('Test', {
      ret: true
    }).length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return p.chevron('Test', {
      ret: true,
      indent: 2
    }).length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return p.chevron('Test', {
      ret: true,
      log: false,
      indent: 2
    }).length.should.equal('>>>         Test'.length);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.chevron('Test', {
      ret: true
    }).indexOf('>>>'), 0);
  });
});

//: Test Bullet Method
describe('bullet()', function() {
  it('Return boolean', function() {
    return p.bullet('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.bullet('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.bullet('Test', {
      ret: true
    }).length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return p.bullet('Test', {
      ret: true,
      indent: 2
    }).length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return p.bullet('Test', {
      ret: true,
      log: false,
      indent: 2
    }).length.should.equal('•         Test'.length);
  });
  return it('Contains preset characters', function() {
    return assert.equal(p.bullet('Test', {
      ret: true
    }).indexOf('•'), 0);
  });
});

//: Test Log Method
describe('log()', function() {
  it('Return boolean', function() {
    return p.log('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return p.log('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return p.log('Test', {
      ret: true
    }).length.should.equal(COLS);
  });
  it('Proper length with emoji', function() {
    return p.log('Test', {
      ret: true,
      emoji: 'smile'
    }).length.should.equal(COLS);
  });
  return it('Contains text', function() {
    return assert.equal(p.log('Test', {
      ret: true
    }).indexOf('Test'), 0);
  });
});

//: Test Title Box Method
describe('titleBox()', function() {
  it('Return boolean', function() {
    return p.titleBox('Title').should.be.a('boolean');
  });
  return it('Return string', function() {
    return p.titleBox('Title', {
      ret: true
    }).should.be.a('string');
  });
});

//::: End Program :::
