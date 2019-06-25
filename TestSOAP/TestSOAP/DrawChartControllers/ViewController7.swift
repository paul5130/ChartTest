
import UIKit
import Charts

class ViewController7: UIViewController {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        //不顯示右側y軸的文字
        view.rightAxis.drawLabelsEnabled = false
        //右側y軸不使用
        view.rightAxis.enabled = false
        //刻度反向排列
        view.leftAxis.inverted = true
        //顯示文字於內側
        view.leftAxis.labelPosition = .insideChart
        //x軸寬度
        view.leftAxis.axisLineWidth = 2
        //x軸顏色
        view.leftAxis.axisLineColor = .orange
        //最小刻度
        view.leftAxis.axisMinimum = -100
        //最大刻度
        view.leftAxis.axisMaximum = 100
        //最小間隔
        view.leftAxis.granularity = 50
        //畫零刻度線
        view.leftAxis.drawZeroLineEnabled = true
        //0刻度線顏色
        view.leftAxis.zeroLineColor = .orange
        //0刻度線寬
        view.leftAxis.zeroLineWidth = 2
        //0刻度線虛線
        view.leftAxis.zeroLineDashLengths = [4,2]
        //設定格線顏色
//        view.leftAxis.gridColor = .orange
        //設定隔線寬度
//        view.leftAxis.gridLineWidth = 2
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
