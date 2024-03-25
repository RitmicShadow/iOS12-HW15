//
//  View.swift
//  iOS12-HW15
//
//  Created by Ден Майшев on 26.03.2024.
//

import UIKit
import SnapKit

class View: UIView {

    lazy var tabelView: UITableView = {
        let tabelView = UITableView(frame: .zero, style: .grouped)
        tabelView.register(TabelViewCell.self, forCellReuseIdentifier: TabelViewCell.identifier)
        tabelView.register(SwithTableViewCell.self, forCellReuseIdentifier: SwithTableViewCell.identifier)
        tabelView.backgroundColor = UIColor.systemBackground
        return tabelView
    }()

    init() {
        super.init(frame: .zero)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    func setupHierarhy() {
        addSubview(tabelView)
    }

    func setupLayout() {
        tabelView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
