//
//  StickyHeaderVC.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 29.5.2022.
//

import Foundation
import UIKit

final class StickyHeaderVC: ViewController {

    var hasOpened = false

    override func viewDidLoad() {
        super.viewDidLoad()

        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: defaultHeaderHeight)
        view.addSubviews(tableView, headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerHeightConstraint,

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let neededInset = defaultHeaderHeight - view.safeAreaInsets.top

        tableView.contentInset.top = neededInset
        if !hasOpened {
            tableView.contentOffset.y = -neededInset
            hasOpened = true
        }
    }

    // MARK: - Private

    private var headerHeightConstraint: NSLayoutConstraint!
    private let defaultHeaderHeight: CGFloat = 300

    private lazy var tableView = UITableView(frame: .zero, style: .plain)
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.dataSource = self
            $0.delegate = self

            $0.registerCell(UITableViewCell.self)
        }

    private let headerView = StickyHeaderImageView()
}

extension StickyHeaderVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(UITableViewCell.self, forIndexPath: indexPath)
            .configure {
                $0.textLabel?.text = "Course \(indexPath.row)"
            }
    }
}

// MARK: - UIScrollViewDelegate

extension StickyHeaderVC: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let defaultOffset = offset + defaultHeaderHeight - tableView.frame.minY

        let inset = defaultHeaderHeight - view.safeAreaInsets.top
        let totalContent = tableView.contentSize.height - inset
        let remaining = totalContent - inset - offset
        let insetOfTotal = inset / totalContent

        let remainingOf = remaining * insetOfTotal

        scrollView.verticalScrollIndicatorInsets.top = defaultOffset < 0 ? -offset : remainingOf

        if offset < 0 {
            headerHeightConstraint.constant = defaultHeaderHeight - defaultOffset
        } else {
            headerHeightConstraint.constant = view.safeAreaInsets.top
        }
    }
}

// MARK: - UITableViewDelegate

extension StickyHeaderVC: UITableViewDelegate {}
