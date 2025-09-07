import gleam/list
import types/character
import types/episode
import types/histogram
import types/organization
import types/role
import types/route

pub fn build_histograms(
  episodes: List(episode.Episode),
) -> List(histogram.Histogram) {
  list.append(
    [
      histogram.Histogram(
        route: route.Home,
        data: episodes
          |> list.map(fn(ep) {
            histogram.SeasonImportance(
              season: ep.season,
              episode: ep.episode,
              importance: ep.importance,
            )
          }),
      ),
    ],
    list.append(
      [
        character.benjamin_sisko, character.jake_sisko, character.dax,
        character.kira_nerys, character.miles_obrien, character.bashir,
        character.odo, character.quark, character.worf, character.rom,
        character.nog, character.garak, character.dukat, character.keiko_obrien,
        character.winn, character.bareil, character.michael_eddington,
        character.kasidy_yates, character.leeta, character.gowron,
        character.martok, character.shakaar, character.ziyal, character.damar,
      ]
        |> list.map(fn(char) {
          histogram.Histogram(
            route: route.Character(char),
            data: episode.get_character_episodes(char, episodes),
          )
        }),
      [
        organization.Federation(role.Citizen),
        organization.TrillSymbiosisCommission,
        organization.Bajor,
        organization.Prophets,
        organization.CardassianUnion,
        organization.FerengiAlliance,
        organization.KlingonEmpire,
        organization.Maquis,
        organization.DominionForces,
        organization.MirrorUniverse,
      ]
        |> list.map(fn(org) {
          histogram.Histogram(
            route: route.Organization(org),
            data: episode.get_organization_episodes(org, episodes),
          )
        }),
    ),
  )
}
