import Foundation
import UIKit

final class TinderSwipeCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
        setupGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with profile: Profile) {
        nameLabel.text = "\(profile.name), \(profile.age)"
        bioLabel.text = profile.bio
        ageLabel.text = String(profile.age)
        
        if let imageData = try? Data(contentsOf: profile.imageURL) {
            DispatchQueue.main.async { [self] in
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    func getProfile() -> Profile {
        let name = nameLabel.text ?? ""
        let age = Int(ageLabel.text ?? "") ?? 0
        let bio = bioLabel.text ?? ""
        let imageURL = URL(string: "https://example.com/image-placeholder.jpg")!
        
        return Profile(name: name, age: age, bio: bio, imageURL: imageURL)
    }
    
    // MARK: Private
    
    private var panGestureRecognizer: UIPanGestureRecognizer!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink.withAlphaComponent(0.5)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private func setupSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(bioLabel)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            ageLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bioLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

// MARK: Swipe stuff

extension TinderSwipeCard {
    
    func swipe(_ isRight: Bool) {
        let offscreenPoint = CGPoint(x: isRight ? frame.width * 2 : -frame.width * 2, y: 0)
        UIView.animate(withDuration: 0.3, animations: { [self] in
            transform = CGAffineTransform(translationX: offscreenPoint.x, y: offscreenPoint.y).rotated(by: rotationAngle(for: offscreenPoint))
            alpha = 0.0
        }, completion: { [unowned self] _ in
            removeFromSuperview()
        })
    }
    
    private func setupGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self)
        
        switch gestureRecognizer.state {
        case .began, .changed:
            transform = CGAffineTransform(translationX: translation.x, y: translation.y).rotated(by: rotationAngle(for: translation))
        case .ended:
            if abs(translation.x) > frame.width * 0.4 {
                swipe(translation.x > 0)
            } else {
                resetPosition()
            }
        default:
            break
        }
    }
    
    private func rotationAngle(for translation: CGPoint) -> CGFloat {
        let rotationStrength = min(translation.x / frame.width, 1.0)
        let rotationAngle = (.pi / 8) * rotationStrength
        return rotationAngle
    }
        
    private func resetPosition() {
        UIView.animate(withDuration: 0.3) { [self] in
            transform = .identity
        }
    }
}
