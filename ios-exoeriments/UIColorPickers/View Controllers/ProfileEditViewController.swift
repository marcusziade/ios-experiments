//
//  ProfileEditViewController.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 26.8.2021.
//

import Foundation
import UIKit

final class ProfileEditViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(colorButton)
        NSLayoutConstraint.activate([
            colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    // MARK: - Private

    private lazy var colorButton = UIColorWell()
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.supportsAlpha = false
            $0.addTarget(self, action: #selector(onColorWellChanged), for: .valueChanged)
            $0.backgroundColor = .white
        }

    @objc private func onColorWellChanged() {
        let colorName = colorButton.selectedColor?.accessibilityName ?? "None"
        print(colorName)

        view.backgroundColor = colorButton.selectedColor
    }

    //    @objc private func openColorPicker() {
    //        let colorPicker = UIColorPickerViewController()
    //        present(colorPicker, animated: true)
    //    }
}

#if DEBUG

    import SwiftUI

    struct ProfileEditViewController_Preview: PreviewProvider {
        static var previews: some View = Preview(
            for: ProfileEditViewController()
        )
        .preferredColorScheme(.dark)
    }

#endif
