import Foundation
import UIKit

class BreedPresenter: NSObject, BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    
    func presentBreed(response: Breed.Response) {
        
    }
}

extension BreedPresenter: UICollectionViewDataSource {
    func registerCells(for collectionView: UICollectionView) {
 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
