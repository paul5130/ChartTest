
import UIKit
import Charts

class ViewController2: UIViewController {
    var chartView: LineChartView = {
        let view = LineChartView()
        view.backgroundColor = .yellow
        view.noDataText = "沒有資料ㄋㄟ"
        view.chartDescription?.text = "銷售分析"
        view.chartDescription?.textColor = .red
        //取消Y軸縮放
        view.scaleYEnabled = false
        //雙擊縮放
        view.doubleTapToZoomEnabled = true
        //啟用拖動手勢
        view.dragEnabled = true
        //拖曳後是否有慣性效果
        view.dragDecelerationEnabled = true
        //慣性效果係數
        view.dragDecelerationFrictionCoef = 0.9
        //-----------------------------------------------
        //繪製圖型區域背景
        view.drawGridBackgroundEnabled = true
        //繪製圖形區域編匡
        view.drawBordersEnabled = true
        //背景顏色
        view.gridBackgroundColor = .lightGray
        //編筐顏色
        view.borderColor = .black
        //編筐線條大小
        view.borderLineWidth = 5
        //圖例文字顏色
        view.legend.textColor = .purple
        //圖例大小
        view.legend.formSize = 10
        //圖例樣式
        view.legend.form = .circle
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
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "圖例1")
        
        var dataEntries2 = [ChartDataEntry]()
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        let chartDataSet2 = LineChartDataSet(entries: dataEntries2, label: "圖例2")
        
        let chartData = LineChartData(dataSets: [chartDataSet,chartDataSet2])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
