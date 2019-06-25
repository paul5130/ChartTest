
import UIKit
import Charts

class ViewController14: UIViewController {
    lazy var chartView: BarChartView = {
        let view = BarChartView()
//        view.animate(yAxisDuration: 1, easingOption: .easeOutCubic)
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
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10{
            let y = arc4random()%100
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "圖標")
        //可使用多個顏色
        chartDataSet.colors = [.yellow,.orange,.red]
        //可增加編筐
        chartDataSet.barBorderColor = .purple
        chartDataSet.barBorderWidth = 1
        let chartData = BarChartData(dataSets: [chartDataSet])
        //修改柱子寬度
        chartData.barWidth = 0.5
        chartView.data = chartData
        //陰影背景
        chartView.drawBarShadowEnabled = true
        //柱子文字顯示方式
        chartView.drawValueAboveBarEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
