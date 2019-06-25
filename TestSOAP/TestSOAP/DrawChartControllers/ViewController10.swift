
import UIKit
import Charts

class ViewController10: UIViewController,ChartViewDelegate {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.delegate = self
        //取消X軸縮放
        view.scaleXEnabled = false
        //取消Y軸縮放
        view.scaleYEnabled = false
        //取消雙擊縮放
        view.doubleTapToZoomEnabled = false
        return view
    }()
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
    }
    private func drawData(){
        var dataEntries = [ChartDataEntry]()
        for i in 0..<100{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "一天流量")
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
        //最多顯示10個點
        chartView.setVisibleXRangeMaximum(10)
        //顯示最後一個數據
        chartView.moveViewToX(99)
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        //選中資訊移到中間
        self.chartView.moveViewToAnimated(xValue: entry.x - 5, yValue: 0, axis: .left, duration: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
