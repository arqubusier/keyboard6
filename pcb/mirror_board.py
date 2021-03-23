import pcbnew

class MirrorBoard(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "Mirror Board along a dimension and reference point."
        self.category = "N/A"
        self.description = "N/A"
        self.origin = pcbnew.wxPoint(0, 0)

    def Mirror(self, point, orientation):
        new_point = pcbnew.wxPoint(self.origin.x - (point.x - self.origin.x), point.y);
        new_orientation = 180 - orientation
        return (new_point, new_orientation)

    def MirrorLine(self, start, end):
        return (pcbnew.wxPoint(-end.x, end.y), pcbnew.wxPoint(-start.x, start.y))
        
    def Run(self):
        board = pcbnew.GetBoard()
        for module in board.GetModules():
            pos, orient = self.Mirror(module.GetPosition(), module.GetOrientationDegrees())
            module.SetPosition(pos)
            module.SetOrientationDegrees(orient)

MirrorBoard().register()
