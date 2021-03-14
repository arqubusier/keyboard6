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
        print(pos)
        print(pos[0])
        print(pos[1])
        x = float(pos[0])
        y = -float(pos[1])
        sw = 'SW' + str(n)
        module = board.FindModuleByReference(sw)
        point = pcbnew.wxPoint(FromMM(x), FromMM(y))
        module.SetPosition(point)
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
f.close()

Refresh()
