
import UIKit

class ThreeTabController: UIViewController {
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let firstViewController: UIViewController = {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }()
    let secondViewController: UIViewController = {
        let controller = UIViewController()
        controller.view.backgroundColor = .green
        return controller
    }()
    let thirdViewController: UIViewController = {
        let controller = UIViewController()
        controller.view.backgroundColor = .blue
        return controller
    }()
    private var activeViewController: UIViewController?{
        didSet{
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }

    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.setTitle("VC1", for: .normal)
        button.addTarget(self, action: #selector(toFirstController), for: .touchUpInside)
        return button
    }()
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("VC2", for: .normal)
        button.addTarget(self, action: #selector(toSecondController), for: .touchUpInside)
        return button
    }()
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.setTitle("VC3", for: .normal)
        button.addTarget(self, action: #selector(toThirdController), for: .touchUpInside)
        return button
    }()
    
    @objc private func toFirstController(){
        activeViewController = firstViewController
    }
    @objc private func toSecondController(){
        activeViewController = secondViewController
    }
    @objc private func toThirdController(){
        activeViewController = thirdViewController
    }
    private func removeInactiveViewController(inactiveViewController: UIViewController?){
        if let inActiveVC = inactiveViewController{
            inActiveVC.willMove(toParent: nil)
            inActiveVC.view.removeFromSuperview()
            inActiveVC.removeFromParent()
        }
    }
    private func updateActiveViewController(){
        if let activeVC = activeViewController{
            addChild(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParent: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firstButton)
        firstButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view.addSubview(secondButton)
        secondButton.anchor(top: nil, left: firstButton.rightAnchor, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor).isActive = true
        view.addSubview(thirdButton)
        thirdButton.anchor(top: nil, left: secondButton.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: firstButton.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        activeViewController = firstViewController
    }
}

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,right:NSLayoutXAxisAnchor?,paddingTop:CGFloat,paddingLeft:CGFloat,paddingBottom:CGFloat,paddingRight:CGFloat,width:CGFloat,height:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
