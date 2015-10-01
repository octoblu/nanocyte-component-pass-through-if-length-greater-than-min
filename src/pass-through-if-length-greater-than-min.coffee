ReturnValue = require 'nanocyte-component-return-value'

class PassThroughIfLengthGreaterThanMin extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = PassThroughIfLengthGreaterThanMin
