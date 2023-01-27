import Foundation
import UIKit

final class StickyHeaderImageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private let imageView = UIImageView()
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.image = UIImage(named: "duolingo")!
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
}


