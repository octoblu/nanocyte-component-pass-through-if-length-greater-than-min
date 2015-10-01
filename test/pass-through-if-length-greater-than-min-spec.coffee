ReturnValue = require 'nanocyte-component-return-value'
PassThroughIfLengthGreaterThanMin = require '../src/pass-through-if-length-greater-than-min'

describe 'PassThroughIfLengthGreaterThanMin', ->
  beforeEach ->
    @sut = new PassThroughIfLengthGreaterThanMin

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
