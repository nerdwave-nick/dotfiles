local HW_OUT = "alsa_output.usb-Focusrite_Scarlett_4i4_4th_Gen_S40C21M530D516-00.pro-output-0"
local HW_IN  = "alsa_input.usb-Focusrite_Scarlett_4i4_4th_Gen_S40C21M530D516-00.pro-input-0"

-- Headphone / main monitor pair
local MON_L = "playback_AUX0"
local MON_R = "playback_AUX1"

local OUT_SINKS = {
  "virt.primary.out",
  "virt.comms.out",
  "virt.secondary.out",
}

-- Adjust as you want. If you want Comms In to NOT get mic by default, comment it out.
local INBUS_CAPTURE = {
  ["virt.primary.inbus"]   = { L = "capture_AUX0", R = "capture_AUX1" },
  ["virt.comms.inbus"]     = { L = "capture_AUX0", R = "capture_AUX1" },
  ["virt.secondary.inbus"] = { L = "capture_AUX0", R = "capture_AUX1" },
  ["virt.guitar.inbus"]    = { L = "capture_AUX2", R = "capture_AUX3" },
}

------------------------------------------------------------

local linked = {}

local function link_key(out_port_id, in_port_id)
  return tostring(out_port_id) .. "->" .. tostring(in_port_id)
end

local function try_link(out_port, in_port)
  if not out_port or not in_port then return end
  local out_id = out_port.properties["object.id"]
  local in_id  = in_port.properties["object.id"]
  if not out_id or not in_id then return end

  local k = link_key(out_id, in_id)
  if linked[k] then return end

  local link = Link("link-factory", {
    ["link.output.port"] = out_id,
    ["link.input.port"]  = in_id,
    ["object.linger"]    = true,
  })
  link:activate(1)
  linked[k] = true
end

local function get_node(name)
  return ObjectManager {
    Interest { type="node", Constraint { "node.name", "equals", name } }
  }
end

local function get_ports(node_id, direction)
  return ObjectManager {
    Interest {
      type="port",
      Constraint { "node.id", "equals", tostring(node_id) },
      Constraint { "port.direction", "equals", direction },
    }
  }
end

local function find_port(om, pname)
  return om:lookup { Constraint { "port.name", "equals", pname } }
end

local function wire_when_ready(out_node_name, outL, outR, in_node_name, inL, inR, out_dir, in_dir)
  local out_om = get_node(out_node_name)
  local in_om  = get_node(in_node_name)

  local out_node = nil
  local in_node  = nil
  local out_ports = nil
  local in_ports  = nil

  local function attempt()
    if not out_node or not in_node then return end

    local out_id = out_node.properties["object.id"]
    local in_id  = in_node.properties["object.id"]
    if not out_id or not in_id then return end

    if not out_ports then
      out_ports = get_ports(out_id, out_dir)
      out_ports:activate()
    end
    if not in_ports then
      in_ports = get_ports(in_id, in_dir)
      in_ports:activate()
    end

    try_link(find_port(out_ports, outL), find_port(in_ports, inL))
    try_link(find_port(out_ports, outR), find_port(in_ports, inR))
  end

  out_om:connect("object-added", function(_, obj)
    out_node = obj
    out_ports = nil
    attempt()
  end)
  out_om:activate()

  in_om:connect("object-added", function(_, obj)
    in_node = obj
    in_ports = nil
    attempt()
  end)
  in_om:activate()
end

-- A) Hear Out groups
for _, out_sink in ipairs(OUT_SINKS) do
  wire_when_ready(out_sink, "monitor_FL", "monitor_FR", HW_OUT, MON_L, MON_R, "out", "in")
end

-- B) Hardware capture -> In busses
for bus, m in pairs(INBUS_CAPTURE) do
  wire_when_ready(HW_IN, m.L, m.R, bus, "playback_FL", "playback_FR", "out", "in")
end
