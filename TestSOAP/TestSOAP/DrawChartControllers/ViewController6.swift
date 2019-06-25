
import UIKit
import Charts

class ViewController6: UIViewController {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.chartDescription?.text = "本週統計"
        //x軸顯示在下方
        view.xAxis.labelPosition = .bottom
        //x軸寬度
        view.xAxis.axisLineWidth = 2
        //x軸顏色
        view.xAxis.axisLineColor = .green
        //刻度文字顏色
        view.xAxis.labelTextColor = .orange
        //刻度文字大小
        view.xAxis.labelFont = UIFont.systemFont(ofSize: 15)
        //刻度文字傾斜角度
        view.xAxis.labelRotationAngle = -30
        //x軸對應網格線的顏色
        view.xAxis.gridColor = .blue
        //x軸對應網格線的大小
        view.xAxis.gridLineWidth = 2
        //虛線
        view.xAxis.gridLineDashLengths = [4,2]
        //不畫網格線
        view.xAxis.drawGridLinesEnabled = false
        //x軸最大刻度值
//        view.xAxis.axisMaximum = 15
        //x軸最小刻度值
//        view.xAxis.axisMinimum = -15
        //x軸最小間隔
//        view.xAxis.granularity = 15
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
        for i in 0..<3{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
         
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "訪客")
        
        let xValues = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月"]
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        chartView.xAxis.labelCount = 10
        chartView.xAxis.granularity = 1
        chartView.xAxis.axisMinimum = 0
        chartView.xAxis.axisMaximum = 9
        chartView.xAxis.forceLabelsEnabled = true
        chartView.xAxis.granularityEnabled = true
        
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
