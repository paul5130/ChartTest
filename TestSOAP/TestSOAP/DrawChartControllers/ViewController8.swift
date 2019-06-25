
import UIKit
import Charts

class ViewController8: UIViewController {
    var chartView: LineChartView = {
        let view = LineChartView()
        let limitLine1 = ChartLimitLine(limit: 85, label: "Great")
        limitLine1.valueTextColor = .blue
        limitLine1.valueFont = UIFont.systemFont(ofSize: 14)
        //線寬
        limitLine1.lineWidth = 1
        //線條顏色
        limitLine1.lineColor = .green
        //虛線樣式
        limitLine1.lineDashLengths = [4,2]
        view.leftAxis.addLimitLine(limitLine1)
        let limitLine2 = ChartLimitLine(limit: 60, label: "OK")
        view.leftAxis.addLimitLine(limitLine2)
        //將限制線畫在折線後面
        view.leftAxis.drawLimitLinesBehindDataEnabled = true
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
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "圖例1")
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
