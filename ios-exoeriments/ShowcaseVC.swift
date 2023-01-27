import Foundation
import UIKit

final class ShowcaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    // MARK: - Private

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
        .configure {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.dataSource = self
            $0.delegate = self
            $0.registerCell(UITableViewCell.self)
        }
}

// MARK: - UITableViewDataSource

extension ShowcaseVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ShowcaseFeature.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feature = ShowcaseFeature.allCases[indexPath.row]
        return tableView.dequeueCell(UITableViewCell.self, forIndexPath: indexPath)
            .configure {
                $0.textLabel?.text = feature.title
                $0.accessoryType = .disclosureIndicator
            }
    }
}

// MARK: - UITableViewDelegate

extension ShowcaseVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(ShowcaseFeature.allCases[indexPath.row].controller, animated: true)
    }
}


