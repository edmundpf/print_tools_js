var COLS, assert, escRepl, p, presetTest, should, styleTest;

p = require('../utils/printer');

assert = require('chai').assert;

should = require('chai').should();

COLS = process.stdout.columns;

//: Replace ANSI Escape Characters
escRepl = function(text) {
  return text.replace(/\u001b\[.*?m/g, '');
};

//: Test Preset Methods
presetTest = function(func, presetChar, offset = 0) {
  it('Return boolean', function() {
    return func.bind(p)('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return func.bind(p)('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true
    })).length.should.equal(COLS - offset);
  });
  it('Proper length with args', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true,
      dec: 'arrow',
      indent: 2
    })).length.should.equal(COLS - offset);
  });
  it('Proper length without log', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true,
      log: false,
      dec: 'arrow',
      indent: 2
    })).length.should.equal(COLS - offset);
  });
  return it('Contains preset characters', function() {
    return assert.equal(func.bind(p)('Test', {
      ret: true
    }).indexOf(presetChar), 0);
  });
};

//: Test Syle Methods
styleTest = function(func, styleChar) {
  it('Return boolean', function() {
    return func.bind(p)('Test').should.be.a('boolean');
  });
  it('Return string', function() {
    return func.bind(p)('Test', {
      ret: true
    }).should.be.a('string');
  });
  it('Proper length', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true
    })).length.should.equal(COLS);
  });
  it('Proper length with args', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true,
      indent: 2
    })).length.should.equal(COLS);
  });
  it('Proper length without log', function() {
    return escRepl(func.bind(p)('Test', {
      ret: true,
      log: false,
      indent: 2
    })).length.should.equal(`${styleChar}         Test`.length);
  });
  return it('Contains preset characters', function() {
    return assert.equal(func.bind(p)('Test', {
      ret: true
    }).indexOf(styleChar), 0);
  });
};

//: Test Success Method
describe('success()', function() {
  return presetTest(p.success, '✔', 1);
});

//: Test Info Method
describe('info()', function() {
  return presetTest(p.info, 'ℹ', 0);
});

//: Test Warning Method
describe('warning()', function() {
  return presetTest(p.warning, '⚠', 1);
});

//: Test Error Method
describe('error()', function() {
  return presetTest(p.error, '💀', 0);
});

//: Test Arrow Method
describe('arrow()', function() {
  return styleTest(p.arrow, '-->');
});

//: Test Chevron Method
describe('chevron()', function() {
  return styleTest(p.chevron, '>>>');
});

//: Test Bullet Method
describe('bullet()', function() {
  return styleTest(p.bullet, '•');
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
    return escRepl(p.log('Test', {
      ret: true
    })).length.should.equal(COLS);
  });
  it('Proper length with emoji', function() {
    return escRepl(p.log('Test', {
      ret: true,
      emoji: 'smile'
    })).length.should.equal(COLS);
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
