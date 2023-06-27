import UIKit

extension UIImageView {
    func load(from url: URL, completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            var request = URLRequest(url: url)
            BreedEndpoints.setCredentialHeader(request: &request)
            
            let task = SystemRemoteSession().dataTask(request: request) { [weak self] (data, response, error) in
                guard let context = self, let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion()
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    completion()
                    let image = UIImage(data: data)
                    UIView.transition(
                        with: context,
                        duration: 0.5,
                        options: .transitionCrossDissolve,
                        animations: { context.image = image },
                        completion: nil
                    )
                }
            }
            task?.resume()
        }
    }
}
