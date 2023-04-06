import Foundation
import UIKit

final class BodyClockCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(lastNightBackgroundView)
        addSubview(chronotypeBackgroundView)
        addSubview(lastNightView)
        addSubview(chronotypeView)
        NSLayoutConstraint.activate([
            lastNightBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            lastNightBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: lastNightBackgroundView.trailingAnchor),
            
            lastNightView.topAnchor.constraint(equalTo: lastNightBackgroundView.topAnchor),
            lastNightView.centerXAnchor.constraint(equalTo: lastNightBackgroundView.centerXAnchor),
            
            chronotypeBackgroundView.topAnchor.constraint(equalToSystemSpacingBelow: lastNightBackgroundView.bottomAnchor, multiplier: 2),
            chronotypeBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: chronotypeBackgroundView.trailingAnchor),
            
            chronotypeView.topAnchor.constraint(equalTo: chronotypeBackgroundView.topAnchor),
            chronotypeView.centerXAnchor.constraint(equalTo: chronotypeBackgroundView.centerXAnchor),
        ])
    }
    
    private let hourTimelineView = HourTimelineView()
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
        }
    
    private lazy var lastNightView = UIView()
        .configure {
            $0.widthAnchor.constraint(equalToConstant: oneHourWidth * 7).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 8
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    
    private let lastNightBackgroundView = UIView()
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
            $0.backgroundColor = .blue.withAlphaComponent(0.09)
        }
    
    private lazy var chronotypeView = UIView()
        .configure {
            $0.widthAnchor.constraint(equalToConstant: oneHourWidth * 8).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
            $0.backgroundColor = .blue.withAlphaComponent(0.4)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 8
        }
    
    private let chronotypeBackgroundView = UIView()
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
            $0.backgroundColor = .blue.withAlphaComponent(0.09)
        }
    
    private let oneHourWidth = UIScreen.main.bounds.width / 12
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG

import SwiftUI

struct BodyClockCardView_Preview: PreviewProvider {
    static var previews: some View = Preview(for: BodyClockCardView())
}

#endif
