import Foundation
import UIKit

class BreedViewController: UIViewController {
    var interactor: BreedBusinessLogic?
    var breedViewModelList = [Breed.BreedViewModel]()
    var isLoadingMoreItens = false
    private(set) var style = BreedListingStyle()
    private(set) var collectionView: UICollectionView!
    private(set) var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Listing.title
        view.backgroundColor = style.backgroundColor
        
        setupCollectionView()
        setupLoadingSpinner()
        
        interactor?.fetchBreeds(request: Breed.Request())
    }
    
    private func setupLoadingSpinner() {
        loadingSpinner = UIActivityIndicatorView(style: style.spinnerStyle)
        loadingSpinner.color = style.spinnerColor
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loadingSpinner)
        
        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let safeAreaInsets = view.safeAreaInsets
        let centerY = (view.bounds.height - tabBarHeight - navigationBarHeight - safeAreaInsets.bottom) / 2
        
        let constraints = [
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: view.topAnchor, constant: centerY)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: style.getLayout(view.frame.width)
        )
        collectionView.backgroundColor = style.collectionViewColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BreedViewCell.self, forCellWithReuseIdentifier: BreedViewCell.reuseIdentifier)
        
        view.addSubview(collectionView)
    }
    
    func breedViewModel(for index: Int) -> Breed.BreedViewModel? {
        guard breedViewModelList.indices.contains(index) else {
            return nil
        }
        
        return breedViewModelList[index]
    }
}
