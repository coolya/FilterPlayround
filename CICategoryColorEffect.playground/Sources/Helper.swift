import Foundation


public class Helper  {
    public static func getCube(size: Int) -> [[[[Float]]]] {
        var cube = [[[[Float]]]](count: size, repeatedValue: [[[Float]]](count: size, repeatedValue:[[Float]](count: size, repeatedValue: [0.0,0.0,0.0,0.0])))

        for b in 0..<size {
            for g in 0..<size {
                for r in 0..<size {
                    cube[b][g][r][0] = 1.0
                    cube[b][g][r][1] = 1.0
                    cube[b][g][r][2] = 1.0
                    cube[b][g][r][3] = 1.0
                }

            }
        }
        return cube;
    }
}

