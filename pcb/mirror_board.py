import pcbnew

class MirrorBoard(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "Mirror Board along a dimension and reference point."
        self.category = "N/A"
        self.description = "N/A"
        self.origin = pcbnew.wxPoint(0, 0)

    def MirrorPoint(self, point, orientation, flipped):
        new_point = pcbnew.wxPoint(self.origin.x - (point.x - self.origin.x), point.y);
        new_orientation = orientation
        if flipped:
            new_orientation = -orientation
        else:
            new_orientation = 180 - orientation

        return (new_point, new_orientation)

    def MirrorLine(self, start, end):
        return (pcbnew.wxPoint(-start.x, start.y), pcbnew.wxPoint(-end.x, end.y))
        
    def Run(self):
        board = pcbnew.GetBoard()
        for item in board.GetModules():
            pos, orient = self.MirrorPoint(item.GetPosition(), item.GetOrientationDegrees(), item.IsFlipped())
            item.SetPosition(pos)
            item.SetOrientationDegrees(orient)
        for item in board.GetTracks():
            if type(item) is pcbnew.VIA:
                pos, _ = self.MirrorPoint(item.GetPosition(), 0, False)
                item.SetPosition(pos)
            elif type(item) is pcbnew.TRACK:
                start, end = self.MirrorLine(item.GetStart(), item.GetEnd())
                item.SetStart(start)
                item.SetEnd(end)

MirrorBoard().register()
