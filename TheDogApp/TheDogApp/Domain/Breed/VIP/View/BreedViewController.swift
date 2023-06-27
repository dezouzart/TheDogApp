import Foundation
import UIKit

class BreedViewController: UIViewController {
    var interactor: BreedBusinessLogic?
    private var collectionView: UICollectionView!
    private var breedViewModelList = [Breed.BreedViewModel]()
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.color = .white
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Listing.title
        view.backgroundColor = .black
        
        setupCollectionView()
        setupLoadingSpinner()
        
        interactor?.fetchBreeds(request: Breed.Request(page: 0))
    }
    
    private func setupLoadingSpinner() {
        view.addSubview(loadingSpinner)
        let constraints = [
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: getLayout())
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BreedViewCell.self, forCellWithReuseIdentifier: BreedViewCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    private func getLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let inset: CGFloat = 20.0
        let itemsPerRow: CGFloat = 2
        let paddingSpace = inset * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: inset, bottom: 80.0, right: inset)
        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        
        return layout
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
