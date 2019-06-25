
import UIKit
import Charts

class ViewController5: UIViewController,ChartViewDelegate {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.delegate = self
        return view
    }()
    var circleColors = [UIColor]()
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        var chartDataSet = LineChartDataSet()
        chartDataSet = chartView.data?.dataSets[0] as! LineChartDataSet
        let values = chartDataSet.entries
        guard let index = values.firstIndex(where: {$0.x == highlight.x}) else { return }
        //還原顏色
        chartDataSet.circleColors = circleColors
        //設定選中的顏色
        chartDataSet.circleColors[index] = .orange
        //重新畫
        chartView.data?.notifyDataChanged()
        chartView.notifyDataSetChanged()
    }
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        var chartDataSet = LineChartDataSet()
        chartDataSet = chartView.data?.dataSets[0] as! LineChartDataSet
        chartDataSet.circleColors = circleColors
        chartView.data?.notifyDataChanged()
        chartView.notifyDataSetChanged()
    }
    private func drawData(){
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
            //每個點的顏色
            circleColors.append(.cyan)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "圖例1")
        chartDataSet.circleColors = circleColors
        //設定選定的十字線效果
        //十字線顏色
        chartDataSet.highlightColor = .red
        //十字線線寬
        chartDataSet.highlightLineWidth = 2
        //十字線虛線
        chartDataSet.highlightLineDashLengths = [4,2]
        //不顯示垂直的十字線
//        chartDataSet.drawVerticalHighlightIndicatorEnabled = false
        //不顯示水平的十字線
//        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        //不顯示十字線
//        chartDataSet.highlightEnabled = false
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
