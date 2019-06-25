
import UIKit
import Charts

class ViewController28: UIViewController {
    var chartView: PieChartView = {
        let view = PieChartView()
        view.centerText = "中央文字"
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
        //生成5条随机数据
        let dataEntries = (0..<5).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double(arc4random_uniform(50) + 10),
                                     label: "数据\(i)")
        }
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: "数据分布")
        //设置颜色
        chartDataSet.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
        let chartData = PieChartData(dataSet: chartDataSet)
        
        //设置饼状图数据
        chartView.data = chartData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
