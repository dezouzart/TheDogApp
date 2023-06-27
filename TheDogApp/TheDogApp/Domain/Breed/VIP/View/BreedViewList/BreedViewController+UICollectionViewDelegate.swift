import UIKit

extension BreedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = breedViewModel(for: indexPath.row) else { return }
        
        let detailViewController = BreedDetailViewController()
        detailViewController.config(with: viewModel)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
