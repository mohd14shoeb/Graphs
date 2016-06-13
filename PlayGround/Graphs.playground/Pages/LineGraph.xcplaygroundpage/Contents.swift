
import UIKit
import Graphs

let str = "Hello Graphs!!"

let viewFrame = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 180.0)

/* ========= Line graph ========= */

let lineGraph = Graph<String, Int>(type: GraphType.Line, array: [10, 20, 4, 8, 25, 18, 21, 24, 8, 15], min: 0, max: 30)
let lineGraphView = GraphView(frame: viewFrame, graph: lineGraph)

/// Array -> Graph
let lineGraphView1 = (1 ... 10).lineGraph().view(viewFrame)

/// Set graphs range
let range = GraphRange(min: 0, max: 12)
let lineGraphView2 = (1 ... 10).lineGraph(range).view(viewFrame)

/// Set graphs text
let lineGraph3 = (1 ... 10).lineGraph(range){(u, _) -> String? in "\(u.value)pt"}
let lineGraphView3 = lineGraph3.view(viewFrame)

/// Set views apperances
let v4 = lineGraph3.view(viewFrame).lineGraphConfiguration {
    LineGraphViewConfig(lineColor: UIColor.greenColor())
}
let barGraphView4 = v4

let v5 = lineGraph3.view(viewFrame).lineGraphConfiguration {
    LineGraphViewConfig(
        lineColor: UIColor.darkGrayColor(),
        lineWidth: 1.0,
        textColor: UIColor.redColor(),
        textFont: UIFont.boldSystemFontOfSize(12.0),
        dotEnable: true,
        dotDiameter: 20.0
    )
}
let lineGraphView5 = v5

/// Minus values
let range2 = GraphRange(min: -60.0, max: 60.0)
let v6 = [-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0].map{ $0 * 10.0 }.lineGraph(range2).view(viewFrame)
let lineGraphView6 = v6

/// Dictionary -> Graph
let dict = [
    "A": 20.0,
    "B": 3.14,
    "C": 100.3,
    "D": -30.0
]
let lineGraph7 = dict.lineGraph(GraphRange(min: -50.0, max: 120.0)) { (unit, totalValue) -> String? in
    return unit.key! + ":" + String(unit.value)
}
let lineGraphView7 = lineGraph7.view(viewFrame)
