//
// Created by Wellington Alves on 17/08/21.
//

import UIKit

class MovieCollectionPopularController: NSObject {
    let movies: [Movie]

    init(movies: [Movie]) {
        self.movies = movies
    }
}

extension MovieCollectionPopularController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        let movie = self.movies[indexPath.row]

        let urlImage = "https://image.tmdb.org/t/p/w200\(movie.poster_path)"
        cell.poster?.load(url: urlImage)
        return cell
    }
}
