import UIKit

class BreedDetailViewController: UIViewController {
    private let style = BreedDetailStyle()
    
    private var imageView = UIImageView()
    private var name = UILabel()
    private var breedGroup = UILabel()
    private var temperament = UILabel()
    private var origin = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Detail.title
        view.backgroundColor = style.backgroundColor
    }
    
    func config(with viewModel: Breed.BreedViewModel) {
        setupComponents(viewModel)
        addSubviews()
        setupConstraints()
        
        imageView.load(from: viewModel.imageUrl, completion: {})
    }
    
    private func setupComponents(_ viewModel: Breed.BreedViewModel) {
        setupImageView()
        
        let nameTxt = Labels.Breed.name + getLabelText(viewModel.name)
        let groupdTxt = Labels.Breed.group + getLabelText(viewModel.breedGroup)
        let temperamentTxt = Labels.Breed.temperament + getLabelText(viewModel.temperament)
        let originTxt = Labels.Breed.origin + getLabelText(viewModel.origin)
        
        setupLabel(name, text: nameTxt)
        setupLabel(breedGroup, text: groupdTxt)
        setupLabel(temperament, text: temperamentTxt)
        setupLabel(origin, text: originTxt)
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = style.imageCornerRadius
        imageView.image = imageView.placeholderImage
    }
    
    private func setupLabel(_ label: UILabel, text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = style.labelTextColor
        label.textAlignment = style.labelTextAlignment
        label.font = style.labelFont
        label.numberOfLines = style.labelNumberOfLines
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(name)
        view.addSubview(breedGroup)
        view.addSubview(temperament)
        view.addSubview(origin)
    }
    
    private func setupConstraints() {
        let topInset = style.topInset
        let verticalSpacing = style.verticalSpacing
        let imageSize = style.imageSize
        let labelHeight = style.labelHeight
        let leading = style.labelLeading
        let trailing = style.labelTrailing
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: topInset),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: verticalSpacing),
            name.heightAnchor.constraint(equalToConstant: labelHeight),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            breedGroup.topAnchor.constraint(equalTo: name.bottomAnchor, constant: verticalSpacing),
            breedGroup.heightAnchor.constraint(equalToConstant: labelHeight),
            breedGroup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            breedGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
            breedGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            temperament.topAnchor.constraint(equalTo: breedGroup.bottomAnchor, constant: verticalSpacing),
            temperament.heightAnchor.constraint(equalToConstant: labelHeight),
            temperament.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            temperament.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
            temperament.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            origin.topAnchor.constraint(equalTo: temperament.bottomAnchor, constant: verticalSpacing),
            origin.heightAnchor.constraint(equalToConstant: labelHeight),
            origin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            origin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
            origin.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func getLabelText(_ modelText: String?) -> String {
        guard let text = modelText else {
            return Labels.Breed.Erros.notProvided
        }
        return getLabelText(text)
    }
    
    private func getLabelText(_ modelText: String) -> String {
        return modelText.isEmpty ? Labels.Breed.Erros.notProvided : modelText
    }
}
