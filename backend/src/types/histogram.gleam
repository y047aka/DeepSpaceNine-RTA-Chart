import types/route.{type Route}

pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
}

pub type Histogram {
  Histogram(route: Route, data: List(SeasonImportance))
}

pub fn step_by_importance(importance: Int) -> Float {
  case importance {
    5 -> 0.8
    4 -> 0.6
    3 -> 0.3
    2 -> 0.17
    1 -> 0.1
    _ -> 0.0
  }
}
