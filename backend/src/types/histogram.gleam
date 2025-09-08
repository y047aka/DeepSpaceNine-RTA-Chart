pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
}

pub type Histogram {
  Histogram(path: List(String), data: List(SeasonImportance))
}
