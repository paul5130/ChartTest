
import UIKit
import Charts

class ViewController26: UIViewController {
    var chartView: CombinedChartView = {
        let view = CombinedChartView()
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
        //各类型图表的显示次序（后面的覆盖前面的）
        chartView.drawOrder = [DrawOrder.bar.rawValue,
                               DrawOrder.line.rawValue]
        
        //组合图数据
        let chartData = CombinedChartData()
        chartData.barData = generateBarData()
        chartData.lineData = generateLineData()
        
        //设置组合图数据
        chartView.data = chartData
    }
    //生成柱状图数据
    func generateBarData() -> BarChartData {
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "柱状图")
        chartDataSet.colors = [.orange] //全部使用橙色
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        return chartData
    }
    
    //生成折线图数据
    func generateLineData() -> LineChartData {
        //生成10条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为折线图的所有数据
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "折线图")
        chartDataSet.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        chartDataSet.lineWidth = 2.5
        chartDataSet.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255,
                                            alpha: 1))
        chartDataSet.circleRadius = 5
        chartDataSet.circleHoleRadius = 2.5
        chartDataSet.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255,
                                         alpha: 1)
        //目前柱状图只包括1组折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        return chartData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
