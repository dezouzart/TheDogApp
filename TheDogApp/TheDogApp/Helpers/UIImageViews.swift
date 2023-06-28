import UIKit

class ImageCache {
    static let shared = ImageCache()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
}

extension UIImageView {
    var placeholderImage: UIImage? {
        UIImage(named: "placeholder-image")
    }
    
    var errorImage: UIImage? {
        UIImage(named: "error-image")
    }
    
    func load(from url: URL, completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            if let cachedImage =  ImageCache.shared.cache.object(forKey: url.absoluteString as NSString) {
                self.load(cachedImage, with: completion)
                return
            }
            
            var request = URLRequest(url: url)
            BreedEndpoints.setCredentialHeader(request: &request)
            
            let task = self.createTask(request, completion: completion)
            
            task?.resume()
        }
    }
    
    private func createTask(_ request: URLRequest, completion: @escaping () -> Void) -> RemoteSessionDataTask? {
        let task = SystemRemoteSession().dataTask(request: request) { [weak self] (data, response, error) in
            guard let context = self else {
                self?.finishError(completion: completion)
                return
            }
            
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                if let errorImg = context.errorImage {
                    context.load(errorImg, with: completion)
                    return
                } else {
                    self?.finishError(completion: completion)
                    return
                }
            }
            
            if let url = request.url  {
                ImageCache.shared.cache.setObject(image, forKey: url.absoluteString as NSString)
            }
            context.load(image, with: completion)
        }
        
        return task
    }
    
    private func load(_ image: UIImage, with completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
            self.load(image)
        }
    }
    
    private func load(_ image: UIImage) {
        UIView.transition(
            with: self,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { self.image = image },
            completion: nil
        )
    }
    
    private func finishError(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}
