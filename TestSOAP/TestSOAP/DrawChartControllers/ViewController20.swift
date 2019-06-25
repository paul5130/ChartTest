
import UIKit
import Charts
class ViewController20: UIViewController {
    //每个分组之间的间隔
    let groupSpace = 0.31
    
    //同一分组内柱子间隔
    let barSpace = 0.03
    
    //柱子宽度（ (0.2 + 0.03) * 3 + 0.31 = 1.00 -> interval per "group"）
    let barWidth = 0.2
    
    //每组数据条数
    let groupCount = 5
    
    //x轴标签文字
    let years = ["2001", "2002", "2003", "2004", "2005"]
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
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            //每个柱子由两部分数据组成
            let value1 = Double(arc4random()%100)
            let value2 = Double(arc4random()%100)
            let entry = BarChartDataEntry(x: Double(i), yValues: [value1, value2])
            dataEntries.append(entry)
        }
        
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "每日访问量")
        //堆叠柱形图每部分文字标签
        chartDataSet.stackLabels = ["线上", "线下"]
        //堆叠柱形图每部分使用的颜色
        chartDataSet.colors = [ChartColorTemplates.material()[0],
                               ChartColorTemplates.material()[1]]
        
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        //标签文字颜色为白色
        chartData.setValueTextColor(.white)
        
        //设置柱状图数据
        chartView.data = chartData
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
