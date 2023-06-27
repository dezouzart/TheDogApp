import UIKit

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
