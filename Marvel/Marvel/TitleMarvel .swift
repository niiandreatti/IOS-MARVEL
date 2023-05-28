
import Foundation
import UIKit

class AnotherMarvel: UIViewController {
    var titleMarvel: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titleMarvel
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    func configureUI() {
        self.view.addSubview(label)
        configureLayouts()
    }
    
    func configureLayouts(){
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    init(titleMarvel: String) {
        self.titleMarvel = titleMarvel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
