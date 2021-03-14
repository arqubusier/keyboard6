from pcbnew import *
from math import pi
import re
board = GetBoard()


num = r'([-0-9.]+)'
pos_regex = r'\s*'.join([r'\[', num, r',', num, r',', num])
def place_connector(module_name, l):
    module = board.FindModuleByReference(module_name)
    for pos in re.findall(pos_regex, l):
        x = float(pos[0])
        y = -float(pos[1])
        point = pcbnew.wxPoint(FromMM(float(x)), FromMM(float(y)))
        module.SetPosition(point)
        module.SetOrientationDegrees(270)

def place_switches(l):
    n = 1
    for pos in re.findall(pos_regex, l):
        x = float(pos[0])
        y = -float(pos[1])
        sw = 'SW' + str(n)
        module = board.FindModuleByReference(sw)
        point = pcbnew.wxPoint(FromMM(x), FromMM(y))
        module.SetOrientationDegrees(0)
        module.SetPosition(point)
        n += 1
        
def place_thumbs(l):
    n = 27
    for pos in re.findall(pos_regex, l):
        x = float(pos[0])
        y = -float(pos[1])
        sw = 'SW' + str(n)
        module = board.FindModuleByReference(sw)
        point = pcbnew.wxPoint(FromMM(x), FromMM(y))
        module.SetPosition(point)
        n += 1

def orient_thumbs(l):
    n = 27
    for match in re.findall(num, l):
        angle = float(match)
        sw = 'SW' + str(n)
        module = board.FindModuleByReference(sw)
        module.SetOrientationDegrees(angle)
        n += 1


f = open("../positions.echo", "r")
for l in  f:
    type = l.split(',')[0]
    print(l)
    if "trrs" in type:
        place_connector("J1", l)
    elif "usbminib" in type:
        place_connector("J2", l)
    elif "switches" in type:
        place_switches(l)
    elif "thumb_angles" in type:
        orient_thumbs(l)
    elif "thumb_positions" in type:
        place_thumbs(l)

f.close()

Refresh()