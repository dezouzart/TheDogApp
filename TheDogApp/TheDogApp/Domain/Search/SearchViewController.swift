import UIKit

class SearchViewController: UIViewController {
    private var button: UIButton!
    
    private var textField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Search"
        textField.textColor = .seashell
        textField.font = UIFont.helveticaNeue(size: 12)
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.tintColor = .orange
        return textField
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .seashell
        label.textAlignment = .center
        label.font = UIFont.helveticaNeue(size: 12)
        label.backgroundColor = .clear
        label.numberOfLines = 12
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Labels.Breed.Scenes.Search.title
        view.backgroundColor = .black
        
        setupButton()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.tintColor = .seashell
        button.backgroundColor = .darkGray
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(updateLabel), for: .touchUpInside)
        self.button = button
    }
    
    private func setupSubviews() {
        view.addSubview(textField)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        let constraints = [
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 160),
            button.heightAnchor.constraint(equalToConstant: 40),

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            label.heightAnchor.constraint(equalToConstant: 240)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func updateLabel() {
        label.text = "Sorry, search feature is not working yet. The api.dog service is not prepared for breed name search. See more at https://documenter.getpostman.com/view/5578104/2s935hRnak#89124209-a975-4dac-985c-ecd9b25ec2de and https://developers.thecatapi.com/view-account/ylX4blBYT9FaoVd6OhvR?report=gpN-ReBkp"
    }
}
