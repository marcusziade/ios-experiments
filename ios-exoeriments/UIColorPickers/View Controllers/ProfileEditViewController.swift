//
//  ProfileEditViewController.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 26.8.2021.
//

import UIKit

class ProfileEditViewController: UIViewController {

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

    private lazy var colorButton: UIColorWell = {
        let button = UIColorWell().forAutoLayout()
        button.supportsAlpha = false
//        button.setTitle("Choose color", for: .normal)
//        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(onColorWellChanged), for: .valueChanged)
        button.backgroundColor = .white
        return button
    }()

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
