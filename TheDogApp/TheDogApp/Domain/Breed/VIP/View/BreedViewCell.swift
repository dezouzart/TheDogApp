import UIKit

class BreedViewCell: UICollectionViewCell {
    static let reuseIdentifier = "BreedCell"
    private let errorImage = UIImage(named: "error-image")
    
    private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 20.0
            imageView.image = UIImage(named: "placeholder-image")
            return imageView
    }()
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = isSelected ? 4 : 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        isSelected = false
    }
    
    func config(with viewModel: Breed.BreedViewModel) {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 20.0
        
        setupSubviews()
        setupConstraints()
        
        showLoadingView()
        imageView.load(from: viewModel.imageUrl) { [weak self] in
            self?.hideLoadingView()
        }
        
    }
    
    func showLoadingView() {
        loadingSpinner.startAnimating()
    }
    
    func hideLoadingView() {
        loadingSpinner.stopAnimating()
    }
    
    private func setupSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(loadingSpinner)
    }
        
    private func setupConstraints() {
        let constraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
            loadingSpinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
}
