import UIKit
import Charts

class ViewController4: UIViewController {
    
    //折线图
    var chartView: LineChartView = {
        let view = LineChartView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //创建折线图组件对象
        view.addSubview(chartView)
        chartView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
        //半透明蓝色背景
        chartView.gridBackgroundColor = UIColor(red: 51/255, green: 181/255, blue: 229/255,
                                                alpha: 150/255)
        chartView.drawGridBackgroundEnabled = true
        
        
        //生成第一根折线的数据
        var dataEntries1 = [ChartDataEntry]()
        for i in 0..<20 {
            let y = arc4random()%10 + 20
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries1.append(entry)
        }
        let chartDataSet1 = LineChartDataSet(entries: dataEntries1, label: "最高温度")
        chartDataSet1.drawCirclesEnabled = false
        chartDataSet1.fillAlpha = 1
        chartDataSet1.drawFilledEnabled = true
        chartDataSet1.fillColor = .white
        chartDataSet1.lineWidth = 2
        chartDataSet1.drawValuesEnabled = false //不绘制拐点上的文字
        chartDataSet1.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.chartView.leftAxis.axisMaximum) //向上绘制填充区域
        }
        
        //生成二根折线的数据
        var dataEntries2 = [ChartDataEntry]()
        for i in 0..<20 {
            let y = arc4random()%10
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries2.append(entry)
        }
        let chartDataSet2 = LineChartDataSet(entries: dataEntries2, label: "最低温度")
        chartDataSet2.colors = [.green]
        chartDataSet2.drawCirclesEnabled = false
        chartDataSet2.fillAlpha = 1
        chartDataSet2.drawFilledEnabled = true
        chartDataSet2.fillColor = .white
        chartDataSet2.lineWidth = 2
        chartDataSet2.drawValuesEnabled = false //不绘制拐点上的文字
        chartDataSet2.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.chartView.leftAxis.axisMinimum) //向下绘制填充区域
        }
        
        //目前折线图只包括2根折线
        let chartData = LineChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //设置折现图数据
        chartView.data = chartData
    }
}
