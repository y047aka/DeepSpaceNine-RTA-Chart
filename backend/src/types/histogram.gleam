pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
}

pub type Histogram {
  Histogram(name: String, path: List(String), data: List(SeasonImportance))
}
