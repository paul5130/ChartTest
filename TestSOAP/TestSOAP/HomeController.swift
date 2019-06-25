

import UIKit
import Charts
import SOAPEngine64
class HomeController: UIViewController,XMLParserDelegate,UITableViewDelegate,UITableViewDataSource {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    let titleArray = [
        "折線圖1:基本配置",
        "折線圖2:整體樣式配置",
        "折線圖3:線條、拐點的樣式配置",
        "折線圖4:面積圖",
        "折線圖5:選中點高亮、十字線樣式",
        "折線圖6:X軸樣式設置",
        "折線圖7:Y軸樣式設置",
        "折線圖8:限制線、警戒線",
        "折線圖9:事件響應、MakerView標籤",
        "折線圖10:顯示指定區域數據、選中居中",
        "折線圖11:動畫效果",
        "折線圖12:獲取、保存圖片、極簡樣式",
        "折線圖13:顏色模板",
        "折線圖14:柱狀圖基本用法",
        "折線圖15:正負柱狀圖",
        "折線圖16:橫向條形圖",
        "折線圖17:正負橫向條形圖",
        "折線圖18:多組數據互相覆蓋柱狀圖",
        "折線圖19:多組數據分組顯示",
        "折線圖20:堆疊柱形圖",
        "折線圖21:正負堆疊柱形圖",
        "折線圖22:正負橫向堆疊柱形圖",
        "折線圖23:散點圖",
        "折線圖24:氣泡圖",
        "折線圖25:燭形圖",
        "折線圖26:折線、柱狀混用",
        "折線圖27:五種圖表混用",
        "28:餅狀圖",
        "29:雷達圖"
    ]
    let viewControllers = [
        ViewController1(),
        ViewController2(),
        ViewController3(),
        ViewController4(),
        ViewController5(),
        ViewController6(),
        ViewController7(),
        ViewController8(),
        ViewController9(),
        ViewController10(),
        ViewController11(),
        ViewController12(),
        ViewController13(),
        ViewController14(),
        ViewController15(),
        ViewController16(),
        ViewController17(),
        ViewController18(),
        ViewController19(),
        ViewController20(),
        ViewController21(),
        ViewController22(),
        ViewController23(),
        ViewController24(),
        ViewController25(),
        ViewController26(),
        ViewController27(),
        ViewController28(),
        ViewController29()
    ]
    private let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        // Do any additional setup after loading the view.
//        testSOAP()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = viewControllers[indexPath.row]
        viewController.navigationItem.title = titleArray[indexPath.row]
        DispatchQueue.main.async {
            viewController.navigationItem.title = self.titleArray[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    func testSOAP(){
        let soap = SOAPEngine()
        soap.setValue("TO", forKey: "region")
        soap.setValue("20180039", forKey: "account")
        soap.setValue("20180039", forKey: "password")
        soap.version = .VERSION_WCF_1_1
        soap.requestURL("http://192.168.24.150/services/reportlock.svc?wsdl", soapAction: "http://hmc.org/services/IWebService/Login", completeWithDictionary: { (statusCode, result) in
//            print("status code = ",statusCode,", result = ",result?.description ?? "")
            guard let result = result else { return }
            result.forEach({ (key,value) in
                print(key,value)
            })
        }) { (error) in
            print("error = ",error?.localizedDescription ?? "")
        }
    }

}

