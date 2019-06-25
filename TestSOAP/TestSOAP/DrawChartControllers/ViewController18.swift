
import UIKit
import Charts

class ViewController18: UIViewController {
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
        var dataEntries1 = [BarChartDataEntry]()
        for i in 0..<10{
            let y = Double(arc4random()%100) + 50
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        
        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "圖標1")
        
        var dataEntries2 = [BarChartDataEntry]()
        for i in 0..<10{
            let y = Double(arc4random()%100) 
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        
        let chartDataSet2 = BarChartDataSet(entries: dataEntries1, label: "圖標2")
        
        //可使用多個顏色
        chartDataSet2.colors = [.orange]
        
        let chartData = BarChartData(dataSets: [chartDataSet1,chartDataSet2])
        
        chartView.data = chartData
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
