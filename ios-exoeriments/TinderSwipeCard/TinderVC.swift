import Foundation
import UIKit

final class TinderVC: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardStackView = TinderCardStackView(frame: view.bounds)
        cardStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cardStackView.delegate = self
        view.addSubview(cardStackView)
        
        fetchProfiles { [unowned self] profiles in
            cardStackView.loadProfiles(profiles)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            cardStackView.handleSwipe(isRightSwipe: true)
        }
    }
    
    // MARK: Private
    
    private var cardStackView: TinderCardStackView!
    
    private func fetchProfiles(completion: @escaping ([Profile]) -> Void) {
        // Simulating an API call with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let profiles = [
                Profile(name: "John", age: 28, bio: "I love traveling and exploring new places.", imageURL: URL(string: "https://example.com/image1.jpg")!),
                Profile(name: "Jane", age: 26, bio: "Coffee lover and food enthusiast.", imageURL: URL(string: "https://example.com/image2.jpg")!),
                Profile(name: "Mike", age: 29, bio: "Passionate about fitness and sports.", imageURL: URL(string: "https://example.com/image3.jpg")!)
            ]
            completion(profiles)
        }
    }
}

extension TinderVC: CardStackViewDelegate {
    
    func cardStackView(_ cardStackView: TinderCardStackView, didSwipeCard card: TinderSwipeCard, isRightSwipe: Bool) {
        let profile = card.getProfile()
        print("Swiped card: \(profile.name), right swipe: \(isRightSwipe)")
    }
}
