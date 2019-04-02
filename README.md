# Dynamic-TableView-Cell-Height-Demo

=========

## A demo app for QR Code Generation, in Swift 5.
## Adjust TableView Cell Height When string length is long or short.

------------
Added Some screens here.

![](https://github.com/pawankv89/Dynamic-TableView-Cell-Height-Demo/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/Dynamic-TableView-Cell-Height-Demo/blob/master/images/screen_2.png)



## Usage
------------

Integration Steps

```swift

class MovieCell: UITableViewCell {

@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!

static let identifire: String = "MovieCell"

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code

}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

// Configure the view for the selected state

}

}

//If You Want to convert Model Class to Json 

//Convert Model Object To Json String
let movie = moviesList[0]
let json = movie.convertToDict()
print("json:-\(json)")


```

There is a sample function in ViewController that you can simply call. 

```swift


override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.

tableview.dataSource = self
tableview.estimatedRowHeight = 80
tableview.rowHeight = UITableView.automaticDimension
//tableview.register(BookCell.self, forCellReuseIdentifier: BookCell.identifire)
tableview.register(UINib(nibName: MovieCell.identifire, bundle: nil), forCellReuseIdentifier: MovieCell.identifire)
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell.identifire, for: indexPath) as! MovieCell

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details
return cell
}

}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
