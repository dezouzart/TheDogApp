import UIKit

class BreedViewCell: UICollectionViewCell {
    static let reuseIdentifier = "BreedCell"
    private let style = BreedCellStyle()
    
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    private var loadingSpinner = UIActivityIndicatorView()
    
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderColor = style.imageBorderColor.cgColor
            imageView.layer.borderWidth = isSelected ? style.imageSelectedBorderWidth : style.imageBorderWidth
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        isSelected = false
    }
    
    func config(with viewModel: Breed.BreedViewModel) {
        self.backgroundColor = style.backgroundColor
        self.layer.cornerRadius = style.cornerRadius
        
        setupComponents()
        addSubviews()
        setupConstraints()
        
        showLoadingView()
        imageView.load(from: viewModel.imageUrl) { [weak self] in
            self?.nameLabel.text = viewModel.name
            self?.hideLoadingView()
        }
        
    }
    
    func showLoadingView() {
        loadingSpinner.startAnimating()
    }
    
    func hideLoadingView() {
        loadingSpinner.stopAnimating()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(loadingSpinner)
        contentView.addSubview(nameLabel)
    }
        
    private func setupConstraints() {
        let constraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
                
            loadingSpinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupComponents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = style.imageCornerRadius
        imageView.image = imageView.placeholderImage
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = style.labelTextColor
        nameLabel.textAlignment = style.labelTextAlignment
        nameLabel.font = style.labelFont
        
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.style = style.spinnerStyle
        loadingSpinner.color = style.spinnerColor
    }
}
