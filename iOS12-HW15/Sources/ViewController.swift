//
//  ViewController.swift
//  iOS12-HW15
//
//  Created by Ден Майшев on 26.03.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController, UITableViewDelegate {

    var models = Section.options

    private var mainView: View? {
        guard isViewLoaded else { return nil }
        return view as? View
    }

    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view = View()
        mainView?.tabelView.delegate = self
        mainView?.tabelView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        17
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        17
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TabelViewCell.identifier,
                for: indexPath
            ) as? TabelViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .swithCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwithTableViewCell.identifier,
                for: indexPath
            ) as? SwithTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .swithCell(let model):
            model.handler()
        }
    }
}
