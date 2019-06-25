
import UIKit
import Charts

class ViewController12: UIViewController {
    lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.legend.enabled = false
        view.leftAxis.enabled = false
        view.leftAxis.spaceTop = 0.4
        view.leftAxis.spaceBottom = 0.4
        view.rightAxis.enabled = false
        view.xAxis.enabled = false
        view.backgroundColor = UIColor(red: 89/255, green: 199/255, blue: 250/255, alpha: 1)
        return view
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveToImage), for: .touchUpInside)
        button.setTitle("Conver to Image ", for: .normal)
        return button
    }()
    @objc func saveToImage(){
        let image = chartView.getChartImage(transparent: true)
        imageView.image = image
    }
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(chartView)
        chartView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 80, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 150)
        view.addSubview(saveButton)
        saveButton.anchor(top: chartView.bottomAnchor, left: chartView.leftAnchor, bottom: nil, right: chartView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        view.addSubview(imageView)
        imageView.anchor(top: saveButton.bottomAnchor, left: chartView.leftAnchor, bottom: nil, right: chartView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        imageView.heightAnchor.constraint(equalTo: chartView.heightAnchor).isActive = true
//        chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        chartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/5).isActive = true
    }
    private func drawData(){
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10{
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "標籤")
        chartDataSet.lineWidth = 1.75
        chartDataSet.circleRadius = 5.0
        chartDataSet.circleHoleRadius = 2.5
        chartDataSet.setColor(.white)
        chartDataSet.setCircleColor(.white)
        chartDataSet.highlightColor = .white
        chartDataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        chartView.data = chartData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        drawData()
    }
    
}
