ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class PassThroughIfLengthGreaterThanMin extends ReturnValue
  onEnvelope: (envelope) =>
    {message,config} = envelope

    return unless _.isArray message
    return if message.length < config.min
    return envelope.message

module.exports = PassThroughIfLengthGreaterThanMin
