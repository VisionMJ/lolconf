angular.module \lolconf .factory \LCStorageFactory, (LC-inicfg-parser) ->
  (path) ->
    {clone-deep} = require 'lodash'

    config = LC-inicfg-parser.parse path
    original = clone-deep config

    get-setting = (key) ->
      [section, real-key] = key.split '.'
      config.get-value section, real-key

    set-setting = !(key, value) ->
      [section, real-key] = key.split '.'
      config
        ..set-value section, real-key, value
        ..write-to-file!

    {
      get: get-setting
      set: set-setting
    }
