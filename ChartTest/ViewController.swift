import UIKit
import Charts

class ViewController: UIViewController {
    
    //折线图
    var chartView = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建折线图组件对象
        chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 300)
        self.view.addSubview(chartView)
        
        //生成第一条折线数据-----------------------------------
        var dataEntries1 = [ChartDataEntry]()
        for i in 0..<8 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        let chartDataSet1 = LineChartDataSet(values: dataEntries1, label: "李子明")
        chartDataSet1.colors = [.red]
        chartDataSet1.circleColors = [.clear]
        chartDataSet1.circleHoleColor = .red
        //生成第二条折线数据-----------------------------------
        var dataEntries2 = [ChartDataEntry]()
        for i in 0..<4 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        dataEntries2.append(ChartDataEntry.init(x: 4, y: 0))
        dataEntries2.append(ChartDataEntry.init(x: 5, y: 60))
        let chartDataSet2 = LineChartDataSet(values: dataEntries2, label: "王大锤")
        chartDataSet2.colors = [.blue]
        chartDataSet2.circleColors = [.clear]
        chartDataSet2.circleHoleColor = .blue
        //目前折线图包括2根折线
        let chartData = LineChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //设置折现图数据
        chartView.data = chartData
    }
}
