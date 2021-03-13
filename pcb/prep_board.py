from pcbnew import *
from math import pi
board = GetBoard()

sw = board.FindModuleByReference("SW0")
sw.SetPosition(pcbnew.wxPoint(FromMM(100), FromMM(100)))

f = open("../positions.echo", "r")
for l in  f:
    type = l.split(',')[0]
    print(l)
    if "trrs" in type:
        print("BBBBB")
        module = board.FindModuleByReference("J1")
        x = l.split(",")[1].strip()[1:]
        y = l.split(",")[2]
        point = pcbnew.wxPoint(FromMM(float(x)), FromMM(float(y)))
        module.SetPosition(point)
        module.SetOrientationDegrees(270)
    elif "usbminib" in type:
        print("HELOOO")
        module = board.FindModuleByReference("J2")
        x = l.split(",")[1].strip()[1:]
        y = l.split(",")[2]
        module.SetPosition(pcbnew.wxPoint(FromMM(float(x)), FromMM(float(y))))
        module.SetOrientationDegrees(270)
f.close()
Refresh()
