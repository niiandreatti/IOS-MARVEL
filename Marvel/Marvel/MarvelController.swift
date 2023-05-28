import UIKit


class MarvelController: UIViewController {
    
    var api: [MovieData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
        setupLayouts()
        navigationItem.hidesBackButton = true
        startApi()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    private lazy var button: UIButton =  {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique aqui", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(button)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
    }
    
    func setupLayouts() {
        
        let collection = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ]
        
        let buttton = [
            button.widthAnchor.constraint(equalToConstant: 170),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
        ]
        
        NSLayoutConstraint.activate(collection + buttton)
    }
        
    func startApi() {
            MarvelApi.serviceApi { api in
                DispatchQueue.main.async {
                    self.api = Array(api.data.shuffled().prefix(5))
                    self.collectionView.reloadData()
                }
            }
        }
    
    @objc func buttonTapped(){
        MarvelApi.serviceApi { api in
            DispatchQueue.main.async {
                self.api = Array(api.data.shuffled().prefix(5))
                self.collectionView.reloadData()
            }
        }
    }
}

   extension MarvelController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return api.count
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
           cell.label.text = api[indexPath.row].title
           cell.label.textAlignment = .center
           return cell
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
              return UIEdgeInsets(top: 16, left: 16, bottom: 32, right: 16)
          }
          
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
              return 15
          }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              present(AnotherMarvel(titleMarvel: api[indexPath.row].directed_by), animated: true, completion: nil)
          }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 160, height: 160)
       }
       
}

      

