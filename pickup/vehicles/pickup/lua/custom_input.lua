-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local function onReset()
  electrics.values['tilt'] = 0
  electrics.values['tilt_input'] = 0
  electrics.values['extend'] = 0
  electrics.values['extend_input'] = 0
  electrics.values['feet'] = 0
  electrics.values['feet_input'] = 0
end

local function updateGFX(dt) -- ms
  electrics.values['tilt'] = math.min(1, math.max(-0.0, (electrics.values['tilt'] + electrics.values['tilt_input'] * dt * 0.25)))
  electrics.values['extend'] = math.min(1, math.max(-0.0, (electrics.values['extend'] + electrics.values['extend_input'] * dt * 0.25)))
  electrics.values['feet'] = math.min(1, math.max(-0.0, (electrics.values['feet'] + electrics.values['feet_input'] * dt * 1.25)))
end

local function tiltBed(value)
  electrics.values.tilt_input = value
end

local function extendBed(value)
  electrics.values.extend_input = value
end

local function extendFeet(value)
  electrics.values.feet_input = value
end

-- public interface
M.onInit    = onReset
M.onReset   = onReset
M.updateGFX = updateGFX
M.tiltBed = tiltBed
M.extendBed = extendBed
M.extendFeet = extendFeet

return M
