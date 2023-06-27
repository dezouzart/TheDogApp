import UIKit

class BreedDetailViewController: UIViewController {
    private let style = BreedDetailStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Detail.title
        view.backgroundColor = style.backgroundColor
    }
    
    func config(with viewModel: Breed.BreedViewModel) {
        print(viewModel)
    }
}
