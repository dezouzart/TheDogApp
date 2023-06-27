import Foundation
import UIKit

class BreedViewController: UIViewController {
    var interactor: BreedBusinessLogic?
    private var collectionView: UICollectionView!
    private var loadingSpinner: UIActivityIndicatorView!
    private var breedViewModelList = [Breed.BreedViewModel]()
    private var style = BreedListingStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Listing.title
        view.backgroundColor = style.backgroundColor
        
        setupCollectionView()
        setupLoadingSpinner()
        
        interactor?.fetchBreeds(request: Breed.Request(page: 0))
    }
    
    private func setupLoadingSpinner() {
        loadingSpinner = UIActivityIndicatorView(style: style.spinnerStyle)
        loadingSpinner.color = style.spinnerColor
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loadingSpinner)
        
        let constraints = [
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
}

extension BreedViewController: BreedDisplayLogic {
    func showLoadingView() {
        loadingSpinner.startAnimating()
    }
    
    func hideLoadingView() {
        loadingSpinner.stopAnimating()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Labels.Alert.dismiss, style: .cancel)
        
        alert.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func displayBreedList(viewModel: Breed.ViewModel) {
        breedViewModelList = viewModel.breedViewModelList
        collectionView.reloadData()
    }
}

extension BreedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension BreedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedViewModelList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BreedViewCell.reuseIdentifier,
            for: indexPath
        ) as! BreedViewCell
        
        guard let breedViewModel = breedViewModel(for: indexPath.row) else { return cell }
        cell.config(with: breedViewModel)
        
        return cell
    }
}

private extension BreedViewController {
    func breedViewModel(for index: Int) -> Breed.BreedViewModel? {
        guard breedViewModelList.indices.contains(index) else {
            return nil
        }
        return breedViewModelList[index]
    }
}
