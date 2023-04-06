import Foundation
import UIKit

protocol CardStackViewDelegate: AnyObject {
    func cardStackView(_ cardStackView: TinderCardStackView, didSwipeCard card: TinderSwipeCard, isRightSwipe: Bool)
}

final class TinderCardStackView: UIView {
    
    weak var delegate: CardStackViewDelegate?
    
    func addCardView(cardView: TinderSwipeCard) {
        insertSubview(cardView, at: 0)
        cardViews.append(cardView)
        cardView.frame = bounds
        cardView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if cardViews.count > 1 {
            let previousCardView = cardViews[cardViews.count - 2]
            previousCardView.transform = CGAffineTransform(scaleX: cardScale, y: cardScale)
        }
    }

    func loadNextCard(with profile: Profile) {
        let cardView = TinderSwipeCard()
        cardView.configure(with: profile)
        addCardView(cardView: cardView)
    }
    
    func loadProfiles(_ newProfiles: [Profile]) {
        profiles.append(contentsOf: newProfiles)
        
        if cardViews.isEmpty {
            loadNextCard(with: profiles.removeFirst())
        }
    }
    
    func handleSwipe(isRightSwipe: Bool) {
        guard !cardViews.isEmpty else { return }
        
        let swipedCard = cardViews.removeLast()
        swipedCard.swipe(isRightSwipe)
        
        delegate?.cardStackView(self, didSwipeCard: swipedCard, isRightSwipe: isRightSwipe)
        
        if !cardViews.isEmpty {
            let nextCard = cardViews.last
            UIView.animate(withDuration: 0.3) {
                nextCard?.transform = .identity
            }
        }
        
        if !profiles.isEmpty {
            loadNextCard(with: profiles.removeFirst())
        }
    }

    // MARK: Private
    
    private let cardScale: CGFloat = 0.9
    
    private var cardViews: [TinderSwipeCard] = []
    private var profiles: [Profile] = []
}
