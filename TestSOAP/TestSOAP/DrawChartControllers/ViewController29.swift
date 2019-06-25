
import UIKit
import Charts

class ViewController29: UIViewController {
    var chartView: RadarChartView = {
        let view = RadarChartView()
        return view
    }()
    //雷达图每个维度的标签文字
    let activities = ["力量", "敏捷", "生命", "智力", "魔法", "幸运"]
    private func setupView(){
        self.view.backgroundColor = UIColor(red: 0x3C/255, green: 0x41/255,
                                            blue: 0x52/255, alpha: 1)
        view.addSubview(chartView)
        chartView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
    }
    private func drawData(){
        //修改网格样式
        chartView.webLineWidth = 1
        chartView.innerWebLineWidth = 1
        chartView.webColor = .lightGray
        chartView.innerWebColor = .lightGray
        chartView.webAlpha = 1
        
        //维度标签文字
        let xAxis = chartView.xAxis
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .white
        
        //最小、最大刻度值
        let yAxis = chartView.yAxis
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 100
        yAxis.labelCount = 4
        yAxis.drawLabelsEnabled = false //不显示刻度值
        yAxis.labelTextColor = .white
        
        //图例样式
        let l = chartView.legend
        l.textColor = .white
        
        //生成6条随机数据
        let dataEntries = (0..<6).map { (i) -> RadarChartDataEntry in
            return RadarChartDataEntry(value: Double(arc4random_uniform(50) + 50))
        }
        let chartDataSet = RadarChartDataSet(entries: dataEntries, label: "李大宝")
        chartDataSet.setColor(UIColor(red: 121/255, green: 162/255,
                                      blue: 175/255, alpha: 1))
        chartDataSet.fillColor = UIColor(red: 121/255, green: 162/255,
                                         blue: 175/255, alpha: 1)
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillAlpha = 0.7
        chartDataSet.lineWidth = 2
        chartDataSet.drawHighlightCircleEnabled = true //选中后显示圆圈
        chartDataSet.setDrawHighlightIndicators(false) //选中后不显示十字线
        
        //目前雷达图只包括1组数据
        let chartData = RadarChartData(dataSets: [chartDataSet])
        chartData.setValueFont(.systemFont(ofSize: 8, weight: .light))
        chartData.setValueTextColor(.white)
        
        //设置雷达图数据
        chartView.data = chartData
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}

extension ViewController29: IAxisValueFormatter {
    //维度标签文字（x轴文字）
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count]
    }
}
