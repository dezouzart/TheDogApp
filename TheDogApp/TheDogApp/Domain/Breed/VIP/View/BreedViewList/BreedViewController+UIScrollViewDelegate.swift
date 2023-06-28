import UIKit

extension BreedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.bounds.height

        if offsetY > contentHeight - height {
            loadMoreItems()
        }
    }
    
    private func loadMoreItems() {
        guard !isLoadingMoreItens else {
            return
        }

        isLoadingMoreItens = true
        interactor?.fetchBreeds(request: Breed.Request())
    }
}
