//
//  ViewController.swift
//  Project1
//
//  Created by Alexander Sobolev on 22.05.2021.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        
        // FileManager.default. Это тип данных, который позволяет нам работать с файловой системой, и в нашем случае мы будем использовать его для поиска файлов.
        let fm = FileManager.default
        // объявляет константу с именем, pathкоторая задает путь к ресурсу пакета нашего приложения. Помните, что Bundle - это каталог, содержащий нашу скомпилированную программу и все наши ресурсы
        let path = Bundle.main.resourcePath!
        // items которая устанавливается для содержимого каталога по пути tems Константа будет массив строк, содержащих имена файлов.
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                pictures.sort()
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

