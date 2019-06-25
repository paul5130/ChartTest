
import UIKit
import Charts

class ViewController3: UIViewController {
    var chartView: LineChartView = {
        let view = LineChartView()
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
        //三種折線顏色交替顯示
        chartDataSet.colors = [.orange,.red,.yellow]
        //設定折線寬度
        chartDataSet.lineWidth = 2
        //外圓顏色
        chartDataSet.circleColors = [.yellow]
        //內圓顏色
        chartDataSet.circleHoleColor = .red
        //外圓半徑
        chartDataSet.circleRadius = 6
        //內圓半徑
        chartDataSet.circleHoleRadius = 2
        //不畫折點
//        chartDataSet.drawCirclesEnabled = false
        //不畫內圓
//        chartDataSet.drawCircleHoleEnabled = false
        //設置虛線各段長度
        chartDataSet.lineDashLengths = [4,2]
        //設置成曲線
        chartDataSet.mode = .horizontalBezier
        //不顯示點的文字
//        chartDataSet.drawValuesEnabled = false
        //開啟填充效果
        chartDataSet.drawFilledEnabled = true
        //設定填充顏色
        chartDataSet.fillColor = .green
        //設定填充顏色透明度
        chartDataSet.fillAlpha = 0.5
        //顯示成百分比
        let formatter = NumberFormatter()
        formatter.positiveSuffix = "%"
        chartDataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
        //顯示成百分比
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
