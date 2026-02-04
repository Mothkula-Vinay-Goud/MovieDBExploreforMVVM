//
//  ViewController.swift
//  MovieDBExploreforMVVM
//
//  Created by Vinay Goud Mothkula on 2/3/26.
// in MVVM View -- Used for displaying UI



import UIKit

class ViewController: UIViewController {
//    MARK: Property
    var firstTableView: UITableView?
    
    var obj : MovieListViewModel? = MovieListViewModel()
    
    //  MARK: View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movies"
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        firstTableView = UITableView()
        firstTableView?.dataSource = self
        firstTableView?.delegate = self
        firstTableView?.translatesAutoresizingMaskIntoConstraints = false
        firstTableView?.register(MovieFirstPageCell.self, forCellReuseIdentifier: "MovieFirstPageCell")
        
        //load mockdata
        obj?.MockData()
        
        addSubviewsConstraints()
    }
    //  MARK: Adding Subviews and Constraints
    func addSubviewsConstraints(){
        if let firstTableView = firstTableView {
            view.addSubview(firstTableView)
            NSLayoutConstraint.activate([
                firstTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                firstTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                firstTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                firstTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                
                ])
        }
        
    }
}
//  MARK: Delegate Methods
extension ViewController: UITableViewDelegate {

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let selectedMovie = obj?.getMovie(indexPath.row) else{return }
            let detailVC = MovieDescriptionVC()
        // Send data
            let viewModel = MovieDescriptionViewModel(selectedMovie: selectedMovie)
            detailVC.objMovieDescriptionVM = viewModel
        // Navigate
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
}

//  MARK: DataSouce Methods
extension  ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj?.getMoviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieFirstPageCell", for: indexPath) as! MovieFirstPageCell
        let selectedMovie = obj?.getMovie(indexPath.row)
        cell.setData(movieModel: selectedMovie ?? MovieModel(title: "Eurovision", score: 143.114, year: 2020, imageView: "eurovision", rating: "4.5", description: "A group of teenagers embark on a road trip to the legendary Eurovision Song Contest, where they must compete in a singing competition against some of the world's greatest artists."))
        return cell
    }
}


