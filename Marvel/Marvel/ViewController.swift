//
//  ViewController.swift
//  Marvel
//
//  Created by Nicolas Santana on 18/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
        loading()
    }

    private lazy var marvelimage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "marvel")
        return image
    }()
    
    
    func configureUI(){
        view.addSubview(marvelimage)
        configureLayouts()
    }
    
    func configureLayouts(){
        let image = [
            marvelimage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            marvelimage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            marvelimage.widthAnchor.constraint(equalToConstant: 200),
            marvelimage.heightAnchor.constraint(equalToConstant: 100),
        ]
        NSLayoutConstraint.activate(image)
    }
    
    func loading() {
        let alertController = UIAlertController(title: nil, message: "Você está preparado?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.navigationController?.pushViewController(MarvelController(), animated: true)
            })
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}

