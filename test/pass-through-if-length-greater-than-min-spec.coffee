ReturnValue = require 'nanocyte-component-return-value'
PassThroughIfLengthGreaterThanMin = require '../src/pass-through-if-length-greater-than-min'

describe 'PassThroughIfLengthGreaterThanMin', ->
  beforeEach ->
    @sut = new PassThroughIfLengthGreaterThanMin

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when a message of length greater than the min', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: 2

        expect(@sut.onEnvelope envelope).to.deep.equal [1,2,3]

    describe 'when a message of length less than the min', ->
      it 'should not return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: 4

        expect(@sut.onEnvelope envelope).not.to.exist

    describe 'when a message of length equal to the min', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: 3

        expect(@sut.onEnvelope envelope).to.deep.equal [1,2,3]

    describe 'when a message is not an array', ->
      it 'should not return the message', ->
        envelope =
          message: 2
          config:
            min: 2

        expect(@sut.onEnvelope envelope).not.to.exist

    describe 'when a min isnt set', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: undefined

        expect(@sut.onEnvelope envelope).to.deep.equal [1,2,3]

    describe 'when a min is not an int', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: 'ab'

        expect(@sut.onEnvelope envelope).to.deep.equal [1,2,3]

    describe 'when a min is the string of an int', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: '4'

        expect(@sut.onEnvelope envelope).to.not.exist

    describe 'when a min is the string of an int but should have a result', ->
      it 'should return the message', ->
        envelope =
          message: [1,2,3]
          config:
            min: '1'

        expect(@sut.onEnvelope envelope).to.deep.equal [1,2,3]
