
import UIKit
import Charts

class ViewController9: UIViewController,ChartViewDelegate {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.delegate = self
        return view
    }()
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
    }
    func showMarkerView(value:String){
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = self.chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        marker.setLabel("数据：\(value)")
        self.chartView.marker = marker
//        let marker = MarkerView(frame: CGRect(x: 20, y: 20, width: 80, height: 20))
//        marker.chartView = self.chartView
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
//        label.text = "数据：\(value)"
//        label.textColor = UIColor.white
//        label.font = UIFont.systemFont(ofSize: 12)
//        label.backgroundColor = UIColor.gray
//        label.textAlignment = .center
//        marker.addSubview(label)
//        self.chartView.marker = marker
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("choose a data")
        showMarkerView(value: "(\(entry.y)")
    }
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        print("cancel choose data")
    }
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        print("chart scaled")
    }
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        print("chart moved")
    }
    private func drawData(){
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "圖例1")
        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
