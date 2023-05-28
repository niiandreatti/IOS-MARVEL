import UIKit

class ViewController: UIViewController {
    var colorIndex = 0
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }

    func createButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("Clique para mudar a cor", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonClicked() {
        view.backgroundColor = colors[colorIndex]
        colorIndex = (colorIndex + 1) % colors.count
    }
}


