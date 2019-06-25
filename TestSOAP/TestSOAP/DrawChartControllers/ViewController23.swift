
import UIKit
import Charts

class ViewController23: UIViewController {
    var chartView: ScatterChartView = {
        let view = ScatterChartView()
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
        //第一组散点图的10条随机数据
        let dataEntries1 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let chartDataSet1 = ScatterChartDataSet(entries: dataEntries1, label: "图例1")
        
        //第二组散点图的10条随机数据
        let dataEntries2 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let chartDataSet2 = ScatterChartDataSet(entries: dataEntries2, label: "图例2")
        chartDataSet2.setColor(.orange) //第二组数据使用橙色
        
        //目前散点图包括2组数据
        let chartData = ScatterChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //设置散点图数据
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
