//
//  ProductResidentCategorieView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentCategorieView: UIView {
  
  // MARK: - Property
  let categorieTableView = UITableView()
  
  let categorieListArr = ["농/수산물", "감자", "5kg", "15,000원", "2020.07.30"]
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  let presentButtonImage = UIImage(systemName: "chevron.right")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
  
  // MARK: - init View
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    
    categorieTableView.dataSource = self
    categorieTableView.rowHeight = 50
    categorieTableView.register(ProductResidentCategorieTableViewCell.self, forCellReuseIdentifier: ProductResidentCategorieTableViewCell.identifier)
    
    self.addSubview(categorieTableView)
    categorieTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      categorieTableView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      categorieTableView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      categorieTableView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      categorieTableView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor)
    ])
  }
}

// MARK: - UITableViewDataSource

extension ProductResidentCategorieView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    categorieListArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = categorieTableView.dequeueReusableCell(withIdentifier: ProductResidentCategorieTableViewCell.identifier, for: indexPath) as! ProductResidentCategorieTableViewCell
    cell.categorieLabel.text = categorieListArr[indexPath.row]
    if indexPath.row < 3 {
      cell.categorieImageView.image = presentButtonImage
    }
    return cell
  }
}