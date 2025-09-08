import types/route.{type Route}

pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
}

pub type Histogram {
  Histogram(route: Route, data: List(SeasonImportance))
}
