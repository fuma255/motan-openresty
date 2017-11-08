-- Copyright (C) idevz (idevz.org)


local ext = require "motan.core.ext"
local endpoint = require "motan.endpoint"
local filter = require "motan.filter"
local ha = require "motan.ha"
local lb = require "motan.lb"
local serialize = require "motan.serialize"
local registry = require "motan.registry"
local utils = require "motan.utils"

local _M = {
    _VERSION = '0.0.1', 
    _DEFAULT_EXT = {}
}

function _add_default_ext(ext)
    endpoint.regist_default_endpoint(ext)
    registry.regist_default_registry(ext)
    filter.regist_default_filter(ext)
    ha.regist_default_ha(ext)
    lb.regist_default_lb(ext)
    serialize.regist_default_serializations(ext)
end

function _M.get_default_ext_factory()
    if utils.is_empty(_M._DEFAULT_EXT) then
        _M._DEFAULT_EXT = ext:new()
        _add_default_ext(_M._DEFAULT_EXT)
    end
    return _M._DEFAULT_EXT
end

return _M
