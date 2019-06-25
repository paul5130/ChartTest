
import UIKit
import Charts

class ViewController25: UIViewController {
    var chartView: CandleStickChartView = {
        let view = CandleStickChartView()
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
        //第一组烛形图的10条随机数据
        let dataEntries1 = (0..<10).map { (i) -> CandleChartDataEntry in
            let val = Double(arc4random_uniform(40) + 10)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = arc4random_uniform(2) % 2 == 0 //true表示开盘价高于收盘价
            return CandleChartDataEntry(x: Double(i),
                                        shadowH: val + high,
                                        shadowL: val - low,
                                        open: even ? val + open : val - open,
                                        close: even ? val - close : val + close)
        }
        let chartDataSet1 = CandleChartDataSet(entries: dataEntries1, label: "图例1")
        
        //目前烛形图包括1组数据
        let chartData = CandleChartData(dataSets: [chartDataSet1])
        
        //设置烛形图数据
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
