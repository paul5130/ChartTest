
import UIKit
import Charts

class ViewController17: UIViewController {
    lazy var chartView: HorizontalBarChartView = {
        let view = HorizontalBarChartView()
        view.legend.enabled = false
        view.xAxis.labelPosition = .bottom
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
            let y = Double(arc4random()%100) - 50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //根据正负值生成每个立柱使用的颜色
        let red = UIColor(red: 211/255, green: 74/255, blue: 88/255, alpha: 1)
        let green = UIColor(red: 110/255, green: 190/255, blue: 102/255, alpha: 1)
        let colors = dataEntries.map { (entry) -> NSUIColor in
            return entry.y > 0 ? green : red
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "圖標")
        //可使用多個顏色
        chartDataSet.colors = colors
        
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        chartView.data = chartData
        chartView.fitScreen()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
