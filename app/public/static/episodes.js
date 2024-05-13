const episodes = [
  {
    season: 1,
    episode: 1,
    title: "Emissary",
    title_ja: "聖なる神殿の謎",
    importance: 4,
    netflix_id: 70205806,
    netflix_synopsis: "宇宙ステーションDS9(ディープ･スペース･ナイン)に赴任したベンジャミン･シスコ司令官。そこは安定した独特のワームホール横に位置していた。",
    url_imdb: "https://www.imdb.com/title/tt0108214/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Jean-Luc Picard", contrast: 2 },
      { name: "Opaka", contrast: 3 },
      { name: "Jennifer Sisko", contrast: 2 },
      { name: "Dukat", contrast: 3 },
      { name: "Rom", contrast: 2 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
      { name: "Federation", contrast: 5 },
      { name: "Trill", contrast: 1 },
      { name: "Bajor", contrast: 5 },
      { name: "Prophet", contrast: 5 },
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 1,
    episode: 2,
    title: "A Man Alone",
    title_ja: "宇宙ステーション殺人事件",
    importance: 3,
    netflix_id: 70205809,
    netflix_synopsis: "DS9に集まる異星人たちは新しい生活に慣れようとしていた。そんな中、ある男が殺され、彼を敵視していた保安主任のオドーが殺人容疑をかけられる。",
    url_imdb: "https://www.imdb.com/title/tt0708494/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 4 },
      { name: "Rom", contrast: 2 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 3,
    title: "Past Prologue",
    title_ja: "“スペース・テロリスト”ターナ・ロス",
    importance: 4,
    netflix_id: 70205808,
    netflix_synopsis: "ベシアは黒い噂があるカーデシア人と出会う。一方、キラの元戦友でベイジョー人のターナがカーデシアに追われ、DS9に逃げ込む。彼の真の狙いとは...。",
    url_imdb: "https://www.imdb.com/title/tt0708576/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 4 },
      { name: "B'Etor", contrast: 2 },
      { name: "Lursa", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 1 },
      { name: "Cardassia", contrast: 1 }
    ]
  },
  {
    season: 1,
    episode: 4,
    title: "Babel",
    title_ja: "恐怖のウィルス",
    importance: 3,
    netflix_id: 70205810,
    netflix_synopsis: "機械トラブルの対応に追われるオブライエンだったが、突然失語症になってしまう。それは、感染すると自律神経が侵される致死のウイルスだった。",
    url_imdb: "https://www.imdb.com/title/tt0708501/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 5,
    title: "Captive Pursuit",
    title_ja: "ワーム・ホールから来たエイリアン",
    importance: 3,
    netflix_id: 70205811,
    netflix_synopsis: "クワークの言動に対する苦情を聞くシスコの元に、ワームホールから異星人トスクが現れる。何やら追われているようだが、事情を話そうとしない。",
    url_imdb: "https://www.imdb.com/title/tt0708513/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 6,
    title: "Q-Less",
    title_ja: "超生命体\"Q\"",
    importance: 1,
    netflix_id: 70205812,
    netflix_synopsis: "ガンマ宇宙域から、ピカード艦長の元恋人バッシュと超生命体Qが現れる。行動が予測不能なQの存在に気づいたオブライエンは、警戒を呼びかける。",
    url_imdb: "https://www.imdb.com/title/tt0708586/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Q", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 7,
    title: "Dax",
    title_ja: "共生結合体生物\"トリル族\"",
    importance: 4,
    netflix_id: 70205813,
    netflix_synopsis: "30年前にクレストロン4の英雄を暗殺した容疑をかけられるダックス大尉。だが、事件当時のホストは現在のジャッジアではなく、クルゾンだった。",
    url_imdb: "https://www.imdb.com/title/tt0708523/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 4 }
    ]
  },
  {
    season: 1,
    episode: 8,
    title: "The Passenger",
    title_ja: "宇宙囚人\"バンティカ\"",
    importance: 2,
    netflix_id: 70205814,
    netflix_synopsis: "べシアとキラは救難信号を受け、コブリアド船から女性1人と、彼女が護送していた凶悪犯を転送した。この凶悪犯は救出前に死んだと思われたが...。",
    url_imdb: "https://www.imdb.com/title/tt0708633/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 9,
    title: "Move Along Home",
    title_ja: "死のゲーム",
    importance: 2,
    netflix_id: 70205815,
    netflix_synopsis: "正装をしたシスコ司令官は、ガンマ宇宙域から来た初の使節団を正式にDS9に迎えていた。やがて使節団の面々はクワークの店で危険なゲームを始める。",
    url_imdb: "https://www.imdb.com/title/tt0708569/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 10,
    title: "The Nagus",
    title_ja: "宇宙商人フェレンギ星人",
    importance: 4,
    netflix_id: 70205816,
    netflix_synopsis: "フェレンギ人の最高位グランド･ネーガスが来訪する。引退表明した彼は後継者にクワークを指名するが、この地位には命を狙われるリスクがあった。",
    url_imdb: "https://www.imdb.com/title/tt0708632/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Nog", contrast: 4 },
      { name: "Zek", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 }
    ]
  },
  {
    season: 1,
    episode: 11,
    title: "Vortex",
    title_ja: "エイリアン殺人事件",
    importance: 2,
    netflix_id: 70205817,
    netflix_synopsis: "貴重な品物をめぐり売り手と交渉するクワークの前に、異星人が邪魔に入る。オドーはその異星人から自分と同じ流動体生物がガンマ宇宙域にいると聞く。",
    url_imdb: "https://www.imdb.com/title/tt0708659/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 12,
    title: "Battle Lines",
    title_ja: "戦慄のガンマ宇宙域",
    importance: 4,
    netflix_id: 70205818,
    netflix_synopsis: "ベイジョーの精神的指導者カイ･オパカがDS9を訪れ、ワームホールへ案内することに。だが何者かに攻撃され、戦いで疲弊した惑星に不時着する。",
    url_imdb: "https://www.imdb.com/title/tt0708504/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 5 }
    ]
  },
  {
    season: 1,
    episode: 13,
    title: "The Storyteller",
    title_ja: "混迷の惑星\"ベイジョー\"",
    importance: 3,
    netflix_id: 70205819,
    netflix_synopsis: "シスコとキラは、対立を続けるベイジョーの2つの勢力を調停することに。一方、救命の要請を受けベイジョーの村に赴いたオブライエンに意外な展開が。",
    url_imdb: "https://www.imdb.com/title/tt0708643/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 }
    ]
  },
  {
    season: 1,
    episode: 14,
    title: "Progress",
    title_ja: "第五の月\"ジェラドー\"",
    importance: 5,
    netflix_id: 70205820,
    netflix_synopsis: "ベイジョー政府は宇宙連邦の協力の元、\"第五の月\"のエネルギー開発に着手することになる。キラは月の住人たちを退去させようとするが...。",
    url_imdb: "https://www.imdb.com/title/tt0708584/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 5 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 }
    ]
  },
  {
    season: 1,
    episode: 15,
    title: "If Wishes Were Horses",
    title_ja: "夢幻の刻",
    importance: 2,
    netflix_id: 70205821,
    netflix_synopsis: "宇宙域のプラズマフィールドから大量のトロン放出が検知され、シスコ、キラ、ダックスは調査を開始。亜空間断裂により人々の想像が実体化し始める。",
    url_imdb: "https://www.imdb.com/title/tt0708551/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 16,
    title: "The Forsaken",
    title_ja: "機械じかけの命",
    importance: 2,
    netflix_id: 70205822,
    netflix_synopsis: "べシアは嫌々、惑星連邦からの使節団の応対をする。そのひとりであるラクサナ･トロイ大使は、盗まれた髪飾りを取り戻してくれたオドーに好意を持つ。",
    url_imdb: "https://www.imdb.com/title/tt0708624/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 2 },
      { name: "Lwaxana Troi", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 17,
    title: "Dramatis Personae",
    title_ja: "反逆のテレパス・エネルギー",
    importance: 2,
    netflix_id: 70205823,
    netflix_synopsis: "ある輸送船への対応をめぐりシスコと対立するキラは、反逆を起こそうとする。その様子の異常さに気づいたオドーは、何かの力が働いているのではと疑う。",
    url_imdb: "https://www.imdb.com/title/tt0708528/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 1,
    episode: 18,
    title: "Duet",
    title_ja: "謎のカーデシア星人",
    importance: 5,
    netflix_id: 70205824,
    netflix_synopsis: "コビリアンの貨物船から乗客がDS9に転送される。カラ・ノーラ症候群という病気を発症しているそのカーデシア人に対し、キラは彼が戦犯だと睨む。",
    url_imdb: "https://www.imdb.com/title/tt0708529/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 5 },
      { name: "Dukat", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 1,
    episode: 19,
    title: "In the Hands of the Prophets",
    title_ja: "預言者の導き",
    importance: 4,
    netflix_id: 70205825,
    netflix_synopsis: "ベイジョー人の聖職者がケイコの授業中に現れ、もっと宗教的教育をするよう要求する。それを発端にベイジョー人が授業や任務をボイコットし始める。",
    url_imdb: "https://www.imdb.com/title/tt0708556/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Keiko O'Brien", contrast: 2 },
      { name: "Bareil", contrast: 3 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 },
      { name: "Prophet", contrast: 3 }
    ]
  },
  {
    season: 2,
    episode: 1,
    title: "The Homecoming",
    title_ja: "帰って来た英雄 (パート1)",
    importance: 3,
    netflix_id: 70205826,
    netflix_synopsis: "クワークが差し出したイヤリングに動揺を見せるキラ。戦死したはずのベイジョーの英雄が今もカーデシアに捕らわれていると知り、救出に向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708625/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Rom", contrast: 2 },
      { name: "Dukat", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 },
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 2,
    episode: 2,
    title: "The Circle",
    title_ja: "帰って来た英雄 (パート2)",
    importance: 3,
    netflix_id: 70205827,
    netflix_synopsis: "ジャロ大臣は英雄のリーをキラの後任とし、キラにベイジョーへの帰還を命じる。一方、過激派組織\"サークル\"はますます勢力を増していた。",
    url_imdb: "https://www.imdb.com/title/tt0708618/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Bareil", contrast: 3 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 }
    ]
  },
  {
    season: 2,
    episode: 3,
    title: "The Siege",
    title_ja: "帰って来た英雄 (パート3)",
    importance: 3,
    netflix_id: 70205828,
    netflix_synopsis: "ベイジョーのクーデター勢力が攻め込むまであと5時間弱。ベイジョー人以外は命が危ないため、一般人や子供たちはDS9からの撤退を余儀なくされる。",
    url_imdb: "https://www.imdb.com/title/tt0708639/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Keiko O'Brien", contrast: 2 },
      { name: "Rom", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Bareil", contrast: 2 },
      { name: "Winn", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 }
    ]
  },
  {
    season: 2,
    episode: 4,
    title: "Invasive Procedures",
    title_ja: "突然の侵入者",
    importance: 2,
    netflix_id: 70205829,
    netflix_synopsis: "プラズマ分裂の嵐のため、数名を除いた全ての住人がDS9から避難する。そこに、ダックスが保有する共生生命体を狙うトリル人が押し入ってくる。",
    url_imdb: "https://www.imdb.com/title/tt0708561/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 4 }
    ]
  },
  {
    season: 2,
    episode: 5,
    title: "Cardassians",
    title_ja: "戦慄のカーデシア星人",
    importance: 4,
    netflix_id: 70205830,
    netflix_synopsis: "カーデシア人の少年を見かけたガラックは、仲間だと思い話しかけるが、噛まれてしまう。その少年は、べイジョー人に育てられた戦災孤児だった。",
    url_imdb: "https://www.imdb.com/title/tt0708514/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 2 },
      { name: "Garak", contrast: 3 },
      { name: "Dukat", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 2,
    episode: 6,
    title: "Melora",
    title_ja: "エレージアン星人 メローラ・パズラー少尉",
    importance: 2,
    netflix_id: 70205831,
    netflix_synopsis: "ガンマ宇宙域の星図作成のため連邦から派遣されたエレージアン人、メローラ･パズラー少尉。ベシアは、障害に負けない努力家の彼女に恋をする。",
    url_imdb: "https://www.imdb.com/title/tt0708567/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 7,
    title: "Rules of Acquisition",
    title_ja: "フェレンギ星人の掟",
    importance: 3,
    netflix_id: 70205832,
    netflix_synopsis: "ダックスやロムとギャンブルを楽しんでいたクワークはグランド･ネーガス･ゼクから朗報を受ける。なんとフェレンギ連盟の交渉役を任されることに。",
    url_imdb: "https://www.imdb.com/title/tt0708593/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 3 },
      { name: "Zek", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 }
    ]
  },
  {
    season: 2,
    episode: 8,
    title: "Necessary Evil",
    title_ja: "殺しの密告者",
    importance: 3,
    netflix_id: 70205833,
    netflix_synopsis: "ベイジョー人の美女の依頼で、彼女の亡き夫が残した箱をDS9から持ち出そうとするクワーク。だが、クワークが箱の中を見たため、何者かに襲われる。",
    url_imdb: "https://www.imdb.com/title/tt0708570/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Rom", contrast: 3 },
      { name: "Dukat", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 },
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 2,
    episode: 9,
    title: "Second Sight",
    title_ja: "愛の幻影",
    importance: 2,
    netflix_id: 70205834,
    netflix_synopsis: "妻の4度目の命日を迎えたシスコは眠れない夜を過ごしていた。切ない気持ちを抱えてステーション内を歩いていると、そこに謎めいた美女が現れる。",
    url_imdb: "https://www.imdb.com/title/tt0708597/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 10,
    title: "Sanctuary",
    title_ja: "さまよえるスクリーア星人",
    importance: 1,
    netflix_id: 70205835,
    netflix_synopsis: "DS9は今にも壊れそうな異星人の船がワームホールを通過したことを検知する。その船の乗客4人をステーションに転送するが、言葉が通じない。",
    url_imdb: "https://www.imdb.com/title/tt0708596/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 11,
    title: "Rivals",
    title_ja: "詐欺師エル・オーリアン星人",
    importance: 1,
    netflix_id: 70205836,
    netflix_synopsis: "未亡人がクワークのバーである男に投資計画を話していると、オドーがその男を詐欺罪で逮捕。その後、拘束室で手に入れたある装置が男の運命を変える。",
    url_imdb: "https://www.imdb.com/title/tt0708591/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 2 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 12,
    title: "The Alternate",
    title_ja: "流動体生物の秘密",
    importance: 3,
    netflix_id: 70205837,
    netflix_synopsis: "オドーの今の姿を作ったモーラ･ポール博士が流動体生物に関する情報を持ってDS9に現れる。オドーの出自の秘密が明らかになるかもしれない。",
    url_imdb: "https://www.imdb.com/title/tt0708613/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 13,
    title: "Armageddon Game",
    title_ja: "最終兵器解体の陰謀",
    importance: 3,
    netflix_id: 70205838,
    netflix_synopsis: "長年戦ってきた2種族が和解する。不要になった生物兵器の解体のために、べシアとオブライエンが派遣されるが、任務完了後に2人は命を狙われる。",
    url_imdb: "https://www.imdb.com/title/tt0708500/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 14,
    title: "Whispers",
    title_ja: "オブライエンの孤立",
    importance: 3,
    netflix_id: 70205839,
    netflix_synopsis: "パラダ星系での任務から戻ったオブライエンは、周囲の自分に対する態度がおかしいことに気づく。家族に避けられ、仕事も奪われた彼は困惑するばかり。",
    url_imdb: "https://www.imdb.com/title/tt0708664/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 15,
    title: "Paradise",
    title_ja: "自然回帰",
    importance: 2,
    netflix_id: 70205840,
    netflix_synopsis: "近隣のMクラス惑星の調査に訪れたシスコとオブライエン。機器が作動しないその星に10年間住んでいるという住民たちは、原始的な生活をしていた。",
    url_imdb: "https://www.imdb.com/title/tt0708574/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 16,
    title: "Shadowplay",
    title_ja: "幻影の村",
    importance: 4,
    netflix_id: 70205841,
    netflix_synopsis: "ガンマ宇宙域のある惑星の表面に異常な分子界が発見され、ダックスとオドーは調査に向かう。その星では、人々が突然失踪するという事件が起きていた。",
    url_imdb: "https://www.imdb.com/title/tt0708599/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 5 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Bareil", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 2,
    episode: 17,
    title: "Playing God",
    title_ja: "宇宙の原型",
    importance: 3,
    netflix_id: 70205842,
    netflix_synopsis: "ダックスはあるトリル人合体候補生の担当教官となる。彼はダックスの噂を聞いて緊張していた。一方、ベイジョー星系を脅かすエネルギー体が現れる。",
    url_imdb: "https://www.imdb.com/title/tt0708580/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 3 },
      { name: "Bajor", contrast: 2 }
    ]
  },
  {
    season: 2,
    episode: 18,
    title: "Profit and Loss",
    title_ja: "クワークの愛",
    importance: 4,
    netflix_id: 70205843,
    netflix_synopsis: "シスコらは故障したカーデシア船からある教授と生徒たちを救助する。教授はクワークと旧知の仲だったが、彼女はカーデシアの政治亡命者となっていた。",
    url_imdb: "https://www.imdb.com/title/tt0708583/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 2,
    episode: 19,
    title: "Blood Oath",
    title_ja: "血の誓い",
    importance: 3,
    netflix_id: 70205844,
    netflix_synopsis: "平穏な日々も束の間、殺された息子の敵討ちに3人のクリンゴン戦士がDS9に集結する。共に復讐を誓ったダックスが女性の姿になっていることに驚く。",
    url_imdb: "https://www.imdb.com/title/tt0708507/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Kor", contrast: 3 },
      { name: "Kang", contrast: 3 },
      { name: "Koloth", contrast: 3 }
    ]
    , organizations: [
      { name: "Trill", contrast: 2 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 2,
    episode: 20,
    title: "The Maquis, Part I",
    title_ja: "戦争回避 (前編)",
    importance: 3,
    netflix_id: 70205845,
    netflix_synopsis: "カーデシアの輸送船がDS9への寄港中に何者かに爆破され、連邦とカーデシアの間に緊張が走る。デュカットは非武装地帯の入植者たちの関与を疑う。",
    url_imdb: "https://www.imdb.com/title/tt0708629/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Dukat", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 },
      { name: "Maquis", contrast: 5 }
    ]
  },
  {
    season: 2,
    episode: 21,
    title: "The Maquis, Part II",
    title_ja: "戦争回避 (後編)",
    importance: 3,
    netflix_id: 70205846,
    netflix_synopsis: "誘拐されたデュカットの捜索に向かったシスコ、キラ、べシアは、マキと名乗る過激派のアジトへたどり着く。そこでシスコは旧友に出くわす。",
    url_imdb: "https://www.imdb.com/title/tt0708630/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Dukat", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 },
      { name: "Maquis", contrast: 5 }
    ]
  },
  {
    season: 2,
    episode: 22,
    title: "The Wire",
    title_ja: "義務と友情",
    importance: 3,
    netflix_id: 70205847,
    netflix_synopsis: "べシアとランチの列に並んでいたガラックは激しい頭痛に襲われる。しかしなぜか彼はべシアの診療を拒み、陰でクワークと怪しげな取引をするのだった。",
    url_imdb: "https://www.imdb.com/title/tt0708648/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 2,
    episode: 23,
    title: "Crossover",
    title_ja: "二人のキラ",
    importance: 2,
    netflix_id: 70205848,
    netflix_synopsis: "ワームホールを通過中に機器トラブルに見舞われたキラとべシアは、2人して平行宇宙へとワープしてしまう。そこでキラはもう1人の自分と対面する。",
    url_imdb: "https://www.imdb.com/title/tt0708522/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 2 }
    ]
    , organizations: [
      { name: "Mirror Universe", contrast: 3 }
    ]
  },
  {
    season: 2,
    episode: 24,
    title: "The Collaborator",
    title_ja: "密告者",
    importance: 4,
    netflix_id: 70205849,
    netflix_synopsis: "ベイジョーで新たな宗教指導者の選挙が行われ、キラの恋人バライルが有力候補となる。しかし対立候補のウィンはバライルの暗い過去を暴こうと...。",
    url_imdb: "https://www.imdb.com/title/tt0708619/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Bareil", contrast: 4 },
      { name: "Opaka", contrast: 2 },
      { name: "Winn", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 }
    ]
  },
  {
    season: 2,
    episode: 25,
    title: "Tribunal",
    title_ja: "疑惑の法廷",
    importance: 4,
    netflix_id: 70205850,
    netflix_synopsis: "ケイコと休暇に出かける途中、オブライエンは元同僚と再会するが、直後にカーデシアに逮捕される。そのまま有罪が確定した裁判にかけられることに。",
    url_imdb: "https://www.imdb.com/title/tt0708656/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 2,
    episode: 26,
    title: "The Jem'Hadar",
    title_ja: "新たなる脅威",
    importance: 4,
    netflix_id: 70205851,
    netflix_synopsis: "シスコはジェイクと親子水入らずの旅行を計画するが、ノーグとクワークもついて来てしまう。旅先の惑星でシスコとクワークはある戦闘種族に捕まる。",
    url_imdb: "https://www.imdb.com/title/tt0708627/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 1,
    title: "The Search, Part I",
    title_ja: "ドミニオンの野望 (前編)",
    importance: 4,
    netflix_id: 70205852,
    netflix_synopsis: "ジェム･ハダーが攻撃してくればDS9はひとたまりもないことがキラの分析で判明する。その脅威に対抗するため、シスコは最強の戦艦を手配していた。",
    url_imdb: "https://www.imdb.com/title/tt0708636/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Michael Eddington", contrast: 2 }
    ]
    , organizations: [
      { name: "Dominion", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 2,
    title: "The Search, Part II",
    title_ja: "ドミニオンの野望 (後編)",
    importance: 4,
    netflix_id: 70205853,
    netflix_synopsis: "ドミニオンの攻撃を受けた直後、衝動に従いキラを連れてオマリオン星系の惑星に向かったオドー。そこはオドーが長い間探し求めていた彼の故郷だった。",
    url_imdb: "https://www.imdb.com/title/tt0708637/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 2 },
      { name: "Michael Eddington", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Dominion", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 3,
    title: "The House of Quark",
    title_ja: "クワークの結婚",
    importance: 3,
    netflix_id: 70205854,
    netflix_synopsis: "客足が悪いクワークのバーで困り果てるロム。唯一の客であるクリンゴン人が自分は一文無しだと言っているらしい。そんな中、ある事件が起きる。",
    url_imdb: "https://www.imdb.com/title/tt0708626/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 4,
    title: "Equilibrium",
    title_ja: "仮面の幻影",
    importance: 4,
    netflix_id: 70205855,
    netflix_synopsis: "会食の席でキーボードを美しく弾き始めたダックス。しかし本人を含め、ダックスの過去のホストに音楽の心得がある者はいないはずだった。",
    url_imdb: "https://www.imdb.com/title/tt0708533/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 5,
    title: "Second Skin",
    title_ja: "恐るべき過去",
    importance: 3,
    netflix_id: 70205856,
    netflix_synopsis: "キラは自分が10年前にカーデシアの収容所にいたと知る。その収容所に向かう途中で何者かにさらわれたキラは、目覚めるとカーデシア人になっていた。",
    url_imdb: "https://www.imdb.com/title/tt0708598/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 5 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 6,
    title: "The Abandoned",
    title_ja: "捨て子の秘密",
    importance: 4,
    netflix_id: 70205857,
    netflix_synopsis: "ある女船長からガンマ宇宙域で難破した船を買い取ったクワークは、船内に赤ん坊を見つける。驚異的なスピードで成長し、青年になった彼の正体とは。",
    url_imdb: "https://www.imdb.com/title/tt0708611/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 7,
    title: "Civil Defense",
    title_ja: "暴徒制圧モード始動",
    importance: 4,
    netflix_id: 70205858,
    netflix_synopsis: "DS9内の鉱石加工場で古いファイルを削除していたジェイクとオブライエン。作業中に、カーデシア占領時代の暴動制圧プログラムが作動してしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708519/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 2 },
      { name: "Dukat", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 3,
    episode: 8,
    title: "Meridian",
    title_ja: "次元移動惑星M",
    importance: 2,
    netflix_id: 70205859,
    netflix_synopsis: "ガンマ宇宙域を探査していたシスコたちの前に突如、ある惑星が現れる。2つの次元を移動しているというその星の住人とダックスは恋に落ちる。",
    url_imdb: "https://www.imdb.com/title/tt0708568/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 9,
    title: "Defiant",
    title_ja: "奪われたディファイアント",
    importance: 4,
    netflix_id: 70205860,
    netflix_synopsis: "エンタープライズのウィリアム･ライカー中佐がDS9を訪れる。好意を持ったキラは、ライカーを案内しようとディファイアントに乗せるが...。",
    url_imdb: "https://www.imdb.com/title/tt0708524/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Dukat", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 3,
    episode: 10,
    title: "Fascination",
    title_ja: "恋の感謝祭",
    importance: 2,
    netflix_id: 70205861,
    netflix_synopsis: "DS9で年に1度のベイジョーの感謝祭が行われる。愛する人の到着を待つのはキラとオブライエン。ところがお祭りの最中に異様な恋愛騒動が起きる。",
    url_imdb: "https://www.imdb.com/title/tt0708539/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Lwaxana Troi", contrast: 3 },
      { name: "Bareil", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 }
    ]
  },
  {
    season: 3,
    episode: 11,
    title: "Past Tense, Part I",
    title_ja: "2024年暴動の夜 (前編)",
    importance: 3,
    netflix_id: 70205862,
    netflix_synopsis: "シスコ、ダックスとべシアは討論会に参加するためサンフランシスコに向かう。だが、転送中にトラブルが起こり、2024年にタイムスリップしてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708577/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 1 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 12,
    title: "Past Tense, Part II",
    title_ja: "2024年暴動の夜 (後編)",
    importance: 3,
    netflix_id: 70205863,
    netflix_synopsis: "21世紀の歴史に刻まれる英雄、ガブリエル・ベルを死なせてしまったシスコ。彼の代わりを務めるべく、ベルとして暴動事件の人質たちを守ろうとする。",
    url_imdb: "https://www.imdb.com/title/tt0708578/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 13,
    title: "Life Support",
    title_ja: "バライルの死",
    importance: 4,
    netflix_id: 70205864,
    netflix_synopsis: "カーデシアとの和平交渉に向かう途中のベイジョー船が事故に遭い、バライルが重傷を負う。しかし、ウィンはバライルの命より交渉を優先する。",
    url_imdb: "https://www.imdb.com/title/tt0708564/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Bareil", contrast: 4 },
      { name: "Nog", contrast: 3 },
      { name: "Winn", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 },
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 14,
    title: "Heart of Stone",
    title_ja: "可変種の定め",
    importance: 3,
    netflix_id: 70205865,
    netflix_synopsis: "マキがリセピアンの船に攻撃を仕掛けたことを知り、追跡を始めたキラとオドー。たどり着いた惑星の洞窟で、キラは水晶体に足を取られてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708546/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 5 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 5 }
    ]
    , organizations: [
      { name: "Maquis", contrast: 2 }
    ]
  },
  {
    season: 3,
    episode: 15,
    title: "Destiny",
    title_ja: "三匹の毒蛇",
    importance: 4,
    netflix_id: 70205866,
    netflix_synopsis: "シスコはカーデシアの科学者の協力でガンマ宇宙域との通信が可能な亜空間中継機を設置することに。だがベイジョーのヴェデクが預言を理由に反対する。",
    url_imdb: "https://www.imdb.com/title/tt0708525/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 },
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 16,
    title: "Prophet Motive",
    title_ja: "新・金儲けの秘訣",
    importance: 2,
    netflix_id: 70205867,
    netflix_synopsis: "フェレンギのグランド･ネーガス･ゼクがDS9を訪れ、本の執筆のため、クワークの元に滞在するという。その本の内容は意表をつくものだった。",
    url_imdb: "https://www.imdb.com/title/tt0708585/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Zek", contrast: 4 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 2 },
      { name: "Ferengi", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 17,
    title: "Visionary",
    title_ja: "DS9破壊工作",
    importance: 3,
    netflix_id: 70205868,
    netflix_synopsis: "DS9にやってきたロミュランの使節団がドミニオンの情報を要求してくる。彼らは情報をもらう条件で、ディファイアントに遮蔽装置を貸したのだった。",
    url_imdb: "https://www.imdb.com/title/tt0708658/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 3,
    episode: 18,
    title: "Distant Voices",
    title_ja: "老化促進テレパシー",
    importance: 2,
    netflix_id: 70205869,
    netflix_synopsis: "アルトバという異星人が連邦法で禁止されている薬を売るようにベシアに要求する。断られたアルトバは診療室に侵入し、居合わせたベシアを襲う。",
    url_imdb: "https://www.imdb.com/title/tt0708526/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 1 }
    ]
  },
  {
    season: 3,
    episode: 19,
    title: "Through the Looking Glass",
    title_ja: "鏡の裏のシスコ",
    importance: 2,
    netflix_id: 70205870,
    netflix_synopsis: "シスコはオブライエンの分身に拉致され、キラとべシアが1年前に訪れた平行宇宙に連れて行かれる。その世界はシスコの助けを必要としていた。",
    url_imdb: "https://www.imdb.com/title/tt0708650/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 2 },
      { name: "Jennifer Sisko", contrast: 3 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
      { name: "Mirror Universe", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 20,
    title: "Improbable Cause",
    title_ja: "姿なき連合艦隊 (前編)",
    importance: 4,
    netflix_id: 70205871,
    netflix_synopsis: "ガラックがランチから戻ると同時に、店で爆発が起こる。シスコらは、何者かがガラックの命を狙って爆発を事故に見せかけたのではないかと疑う。",
    url_imdb: "https://www.imdb.com/title/tt0708553/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 21,
    title: "The Die Is Cast",
    title_ja: "姿なき連合艦隊 (後編)",
    importance: 4,
    netflix_id: 70205872,
    netflix_synopsis: "カーデシアの元指揮官、エナブラン・テインと再会したガラック。ロミュランと共にドミニオンへの先制攻撃を仕掛けようとするテインと手を組むことに。",
    url_imdb: "https://www.imdb.com/title/tt0708621/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 4 },
      { name: "Michael Eddington", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 22,
    title: "Explorers",
    title_ja: "夢の古代船",
    importance: 3,
    netflix_id: 70205873,
    netflix_synopsis: "シスコはベイジョーの図書館から古代の宇宙船の設計図を持ち帰る。彼は光圧を推進力とするその船を実際に作り、ジェイクと旅してみたいと言い出す。",
    url_imdb: "https://www.imdb.com/title/tt0708534/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Gul Dukat", contrast: 2 },
      { name: "Leeta", contrast: 2 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 },
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 23,
    title: "Family Business",
    title_ja: "クワークの母",
    importance: 4,
    netflix_id: 70205874,
    netflix_synopsis: "フェレンギ会計監査局がクワークの店に立入監査に入る。罪状は\"家族への監督不行き届き\"。クワークの母はフェレンギの法に反して金儲けをしていた。",
    url_imdb: "https://www.imdb.com/title/tt0708537/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Kasidy Yates", contrast: 2 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 24,
    title: "Shakaar",
    title_ja: "シャカールの乱",
    importance: 3,
    netflix_id: 70205875,
    netflix_synopsis: "ベイジョー政府の首相が亡くなり、カイ･ウィンが後継者に指名される。キラはウィンが政治の世界でも実権を握ろうとしていることに嫌悪感を抱く。",
    url_imdb: "https://www.imdb.com/title/tt0708601/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Shakaar", contrast: 4 },
      { name: "Lupaza", contrast: 2 },
      { name: "Furel", contrast: 2 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 }
    ]
  },
  {
    season: 3,
    episode: 25,
    title: "Facets",
    title_ja: "クルゾンの秘密",
    importance: 3,
    netflix_id: 70205876,
    netflix_synopsis: "ダックスは過去のホストたちを呼び出して会話するというトリル族の儀式に向けて準備を進める。そのためにはシスコたちの体を借りる必要があった。",
    url_imdb: "https://www.imdb.com/title/tt0708536/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 5 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 2 },
      { name: "Nog", contrast: 3 },
      { name: "Leeta", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 3 }
    ]
  },
  {
    season: 3,
    episode: 26,
    title: "The Adversary",
    title_ja: "忍び寄る可変種の脅威",
    importance: 4,
    netflix_id: 70205877,
    netflix_synopsis: "大佐に昇格したシスコ。だが祝いの席で、連邦のクラジェンスキー大使はシスコにクーデターの発生を秘密裏に明かす。シスコらは大使と現地に向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708612/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Michael Eddington", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 1,
    title: "The Way of the Warrior",
    title_ja: "クリンゴンの暴挙",
    importance: 4,
    netflix_id: 70205878,
    netflix_synopsis: "マートク将軍率いるクリンゴン艦隊がDS9にやってくる。ドミニオンと戦うために来たというが、どうも様子がおかしい。果たして彼らの真の狙いとは。",
    url_imdb: "https://www.imdb.com/title/tt0394906/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Kasidy Yates", contrast: 2 },
      { name: "Dukat", contrast: 3 },
      { name: "Gowron", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 5 }
    ]
  },
  {
    season: 4,
    episode: 2,
    title: "The Visitor",
    title_ja: "父と子",
    importance: 4,
    netflix_id: 70205880,
    netflix_synopsis: "作家志望のメラニーは、40才前に断筆した作家のジェイク･シスコを訪ねる。ジェイクは事故で亜空間に消えた父のベンジャミンについて語り始める。",
    url_imdb: "https://www.imdb.com/title/tt0708645/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 5 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 3,
    title: "Hippocratic Oath",
    title_ja: "苦悩するジェム・ハダー",
    importance: 2,
    netflix_id: 70205881,
    netflix_synopsis: "ガンマ宇宙域の任務から帰還中のべシアとオブライエン。難破船の発する信号を調査中にある惑星に不時着し、ジェム・ハダーに捕らわれてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708547/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 4,
    title: "Indiscretion",
    title_ja: "デュカットの娘",
    importance: 4,
    netflix_id: 70205882,
    netflix_synopsis: "ベイジョーの密輸人から6年前に消えたカーデシア船の手掛かりをつかんだと聞いたキラは調査に向かう。船にはベイジョー人捕虜たちが乗っていた。",
    url_imdb: "https://www.imdb.com/title/tt0708558/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Kasidy Yates", contrast: 4 },
      { name: "Gul Dukat", contrast: 5 },
      { name: "Ziyal", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 },
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 4,
    episode: 5,
    title: "Rejoined",
    title_ja: "禁じられた愛の絆",
    importance: 5,
    netflix_id: 70205883,
    netflix_synopsis: "シスコはダックスに重要な知らせを告げる。リナーラ・カーン博士が率いるトリルの科学者チームが訪れ、ディファイアントで実験を行うというのだ。",
    url_imdb: "https://www.imdb.com/title/tt0708588/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 5 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Michael Eddington", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 4 }
    ]
  },
  {
    season: 4,
    episode: 6,
    title: "Starship Down",
    title_ja: "ディファイアントの危機",
    importance: 4,
    netflix_id: 70205884,
    netflix_synopsis: "シスコたちはカレマとの貿易交渉のためガンマ宇宙域へと向かう。しかし道中でディファイアントはジェム･ハダーに襲われ、絶体絶命の大ピンチに。",
    url_imdb: "https://www.imdb.com/title/tt0708605/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 7,
    title: "Little Green Men",
    title_ja: "フェレンギ人囚わる",
    importance: 3,
    netflix_id: 70205885,
    netflix_synopsis: "クワークはいとこのゲイラから10年間も約束されていた船をやっと譲り受け、その船で宇宙艦隊アカデミーに入学するノーグを地球へ送ることにする。",
    url_imdb: "https://www.imdb.com/title/tt0708565/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 8,
    title: "The Sword of Kahless",
    title_ja: "カーレスの剣",
    importance: 3,
    netflix_id: 70205886,
    netflix_synopsis: "クリンゴンの英雄コールは、クリンゴン帝国初代皇帝の武器である伝説の\"カーレスの剣\"を探していると言う。ダックスとウォーフは彼を手伝うことに。",
    url_imdb: "https://www.imdb.com/title/tt0708644/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 4 }
    ]
  },
  {
    season: 4,
    episode: 9,
    title: "Our Man Bashir",
    title_ja: "ドクター・ノア",
    importance: 3,
    netflix_id: 70205887,
    netflix_synopsis: "ホロスイートで1960年代のスパイプログラムを楽しんでいたべシア。そこへガラックが現れ、せっかく堪能していたプログラムを台無しにしてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708573/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 2 },
      { name: "Michael Eddington", contrast: 2 },
      { name: "Garak", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 1 }
    ]
  },
  {
    season: 4,
    episode: 10,
    title: "Homefront",
    title_ja: "地球戒厳令 (前編)",
    importance: 4,
    netflix_id: 70205888,
    netflix_synopsis: "地球で開かれていた連邦とロミュランの外交会議の場で爆発事件が起こり、死亡者が27名も出てしまう。現場の映像に映っていたのは可変種だった。",
    url_imdb: "https://www.imdb.com/title/tt0708549/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 3 },
      { name: "Joseph Sisko", contrast: 3 }
    ]
    , organizations: [
      { name: "Federation", contrast: 5 }
    ]
  },
  {
    season: 4,
    episode: 11,
    title: "Paradise Lost",
    title_ja: "地球戒厳令 (後編)",
    importance: 4,
    netflix_id: 70205889,
    netflix_synopsis: "地球全土で大停電が起き、ドミニオンによる破壊工作が疑われる。艦隊による戒厳令が敷かれる中、シスコは士官候補生たちの不可解な動きに気づく。",
    url_imdb: "https://www.imdb.com/title/tt0708575/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Joseph Sisko", contrast: 3 }
    ]
    , organizations: [
      { name: "Federation", contrast: 5 }
    ]
  },
  {
    season: 4,
    episode: 12,
    title: "Crossfire",
    title_ja: "ジェラシー",
    importance: 5,
    netflix_id: 70205890,
    netflix_synopsis: "ベイジョーの首相シャカールが連邦加盟の交渉で訪れる。暗殺計画が判明し、オドーが護衛に付くが、キラと親しげな首相にオドーは内心穏やかではない。",
    url_imdb: "https://www.imdb.com/title/tt0708521/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Shakaar", contrast: 4 },
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 13,
    title: "Return to Grace",
    title_ja: "新たなる戦線",
    importance: 4,
    netflix_id: 70205891,
    netflix_synopsis: "シャカールに頼まれ、キラはクリンゴンについての情報交換のためカーデシアの前線基地へ出向くことに。現地へキラを送るのは左遷されたデュカットだ。",
    url_imdb: "https://www.imdb.com/title/tt0708590/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Dukat", contrast: 4},
      { name: "Ziyal", contrast: 3 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 14,
    title: "Sons of Mogh",
    title_ja: "モーグの息子たち",
    importance: 3,
    netflix_id: 70205892,
    netflix_synopsis: "ウォーフの前に弟カーンが現れ、自分を殺せと頼む。ウォーフが連邦についたせいで一族の名誉は失墜したが、家族の手にかかって死ねば挽回できるという。",
    url_imdb: "https://www.imdb.com/title/tt0708641/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 15,
    title: "Bar Association",
    title_ja: "ロムの反乱",
    importance: 5,
    netflix_id: 70205893,
    netflix_synopsis: "耳の感染症に苦しみつつ働かされていたロムはついに倒れてしまう。クワークの搾取にうんざりした彼はフェレンギに禁じられている組合設立を決意する。",
    url_imdb: "https://www.imdb.com/title/tt0708503/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 5 },
      { name: "Leeta", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 4 }
    ]
  },
  {
    season: 4,
    episode: 16,
    title: "Accession",
    title_ja: "選ばれし者の困惑",
    importance: 4,
    netflix_id: 70205894,
    netflix_synopsis: "何世紀も前のベイジョー船が突如ワームホールから現れた。診療室に転送された乗客は伝説的なベイジョーの詩人で、自分は預言者に選ばれし者だと言う。",
    url_imdb: "https://www.imdb.com/title/tt0708497/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Keiko O'Brien", contrast: 4 },
    ]
    , organizations: [
      { name: "Bajor", contrast: 5 },
      { name: "Prophet", contrast: 5 }
    ]
  },
  {
    season: 4,
    episode: 17,
    title: "Rules of Engagement",
    title_ja: "裁かれるウォーフ",
    importance: 3,
    netflix_id: 70205895,
    netflix_synopsis: "戦闘中に誤ってクリンゴンの民間船を撃墜してしまったウォーフは裁判にかけられ、強制送還の危機に。シスコはウォーフに有利な証拠を集めようとする。",
    url_imdb: "https://www.imdb.com/title/tt0708594/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 18,
    title: "Hard Time",
    title_ja: "つくられた記憶",
    importance: 2,
    netflix_id: 70205896,
    netflix_synopsis: "スパイ容疑で逮捕されたオブライエンは人工の記憶を植え付けられる。それは20年間分の服役体験の記憶で、解放後もその記憶に悩まされることになる。",
    url_imdb: "https://www.imdb.com/title/tt0708545/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 19,
    title: "Shattered Mirror",
    title_ja: "鏡あわせのジェニファー",
    importance: 2,
    netflix_id: 70205897,
    netflix_synopsis: "ジェイクはシスコからある女性を紹介される。その女性の容姿、口調や人柄までが亡き母ジェニファーにそっくりであることにジェイクは驚きを隠せない。",
    url_imdb: "https://www.imdb.com/title/tt0708602/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Jennifer Sisko", contrast: 3 },
      { name: "Nog", contrast: 2 },
      { name: "Garak", contrast: 2 }
    ]
    , organizations: [
      { name: "Mirror Universe", contrast: 3 }
    ]
  },
  {
    season: 4,
    episode: 20,
    title: "The Muse",
    title_ja: "二人の女神",
    importance: 3,
    netflix_id: 70205898,
    netflix_synopsis: "ラクサナがオドーを訪ね、妊娠という驚きの報告をする。だが彼女の夫は、子供が16才になるまで母親から隔離して育てると主張していると言う。",
    url_imdb: "https://www.imdb.com/title/tt0708631/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 21,
    title: "For the Cause",
    title_ja: "裏切り者は誰だ",
    importance: 4,
    netflix_id: 70205899,
    netflix_synopsis: "クリンゴンとカーデシアの抗争が波紋を呼ぶ中、カーデシアへの輸送船がDS9を経由することに。オドーはDS9にマキの一味が潜んでいると疑う。",
    url_imdb: "https://www.imdb.com/title/tt0708543/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 4 },
      { name: "Michael Eddington", contrast: 4 },
      { name: "Ziyal", contrast: 4 },
      { name: "Garak", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 2 },
      { name: "Maquis", contrast: 4 }
    ]
  },
  {
    season: 4,
    episode: 22,
    title: "To the Death",
    title_ja: "戦士の宿命",
    importance: 3,
    netflix_id: 70205900,
    netflix_synopsis: "ジェム･ハダーがDS9を襲撃する。シスコはウォーフ、ダックス、オドー、オブライエンとディファイアントに乗り込み、敵を追ってガンマ宇宙域へ向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708653/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 3 },
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 23,
    title: "The Quickening",
    title_ja: "星に死の満つる時",
    importance: 4,
    netflix_id: 70205901,
    netflix_synopsis: "ガンマ宇宙域で救難信号に応答したキラとダックス、べシアはその惑星に降り立つ。そこは200年前、ジェム･ハダーにより破壊された星だった。",
    url_imdb: "https://www.imdb.com/title/tt0708634/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 4,
    episode: 24,
    title: "Body Parts",
    title_ja: "クワーク、絶体絶命",
    importance: 4,
    netflix_id: 70205902,
    netflix_synopsis: "故郷から戻ってきたクワークは、悲惨なニュースをロムに告げる。自分は珍しい不治の病にかかっており、余命はたったの1週間だと言うのだ。",
    url_imdb: "https://www.imdb.com/title/tt0708508/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Keiko O'Brien", contrast: 4 },
      { name: "Rom", contrast: 3 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 },
      { name: "Cardassia", contrast: 1 }
    ]
  },
  {
    season: 4,
    episode: 25,
    title: "Broken Link",
    title_ja: "可変種の脅威 第二幕 (前編)",
    importance: 5,
    netflix_id: 70205903,
    netflix_synopsis: "オドーが発作を起こした。検査の結果、人間の姿を保つ能力を失いかけていると判明する。回復のためには創設者である同胞の元へ帰るしか道はなかった。",
    url_imdb: "https://www.imdb.com/title/tt0708509/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Gowron", contrast: 2 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 4 }
    ]
  },
  {
    season: 5,
    episode: 1,
    title: "Apocalypse Rising",
    title_ja: "可変種の脅威 第二幕 (後編)",
    importance: 4,
    netflix_id: 70205904,
    netflix_synopsis: "クリンゴンのガウロン宰相は可変種で、ドミニオンのスパイだという疑いが浮上。正体を暴くよう命じられたシスコは、クリンゴンに変装し帝国に向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708499/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 1 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Gowron", contrast: 4 },
      { name: "Martok", contrast: 4 },
      { name: "Dukat", contrast: 3 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 4 }
    ]
  },
  {
    season: 5,
    episode: 2,
    title: "The Ship",
    title_ja: "神の船",
    importance: 3,
    netflix_id: 70205905,
    netflix_synopsis: "シスコ、ダックス、ウォーフ、オブライエンがガンマ宇宙域の惑星を調査中にジェム・ハダーの戦艦が墜落。敵の指揮官から執拗な戦艦の返還要求が届く。",
    url_imdb: "https://www.imdb.com/title/tt0708638/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 3,
    title: "Looking for Par'Mach in All the Wrong Places",
    title_ja: "クワークの再婚",
    importance: 4,
    netflix_id: 70205906,
    netflix_synopsis: "ダックスと一緒にバーにいたウォーフは、そこへ現れたクリンゴン人の美女グリルカに一目惚れする。だがグリルカは実はクワークの元妻だった。",
    url_imdb: "https://www.imdb.com/title/tt0708566/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 5 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Keiko O'Brien", contrast: 3 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 4,
    title: "Nor the Battle to the Strong",
    title_ja: "戦う勇気",
    importance: 3,
    netflix_id: 70205907,
    netflix_synopsis: "取材のためベシアに同行したジェイク。シャトルで移動中に救難信号を受け、クリンゴンに襲撃された連邦の植民地に急行。そこで悲惨な現実を目にする。",
    url_imdb: "https://www.imdb.com/title/tt0708493/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 5,
    title: "The Assignment",
    title_ja: "ケイコのために",
    importance: 4,
    netflix_id: 70205908,
    netflix_synopsis: "ベイジョーから戻った妻ケイコと再会したオブライエンは、彼女から驚愕の事実を聞かされる。ケイコの身体はある生命体に乗っ取られていたのだ。",
    url_imdb: "https://www.imdb.com/title/tt0708615/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 5 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Keiko O'Brien", contrast: 4 },
      { name: "Rom", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 },
      { name: "Prophet", contrast: 4 }
    ]
  },
  {
    season: 5,
    episode: 6,
    title: "Trials and Tribble-ations",
    title_ja: "伝説の時空へ",
    importance: 4,
    netflix_id: 70205909,
    netflix_synopsis: "ダーヴィンという名のクリンゴンのスパイが歴史を変えるために時間を遡る。シスコたちは男の企みを暴き、歴史が変わる前に阻止しなければならない。",
    url_imdb: "https://www.imdb.com/title/tt0708655/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 7,
    title: "Let He Who Is Without Sin...",
    title_ja: "享楽の星・ライサ",
    importance: 2,
    netflix_id: 70205910,
    netflix_synopsis: "最近のダックスの行動に不満を持つウォーフ。休暇で訪れることになった享楽の星ライサで、ダックスと2人だけでじっくり話し合おうと計画する。",
    url_imdb: "https://www.imdb.com/title/tt0708563/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Leeta", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 8,
    title: "Things Past",
    title_ja: "秘められた過去",
    importance: 3,
    netflix_id: 70205911,
    netflix_synopsis: "ベイジョーを訪れたシスコら4人が意識を失った。目を覚ましたのはカーデシア占領下のベイジョー。そこでオドーの意外な闇の過去が明らかになる。",
    url_imdb: "https://www.imdb.com/title/tt0708649/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Dukat", contrast: 3 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 },
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 9,
    title: "The Ascent",
    title_ja: "あの頂を目指せ",
    importance: 4,
    netflix_id: 70205912,
    netflix_synopsis: "無人の惑星に墜落したオドーとクワーク。爆発で通信機材を含め、生存に必要なものが一切失われてしまった。唯一の望みをかけ、2人は山頂を目指す。",
    url_imdb: "https://www.imdb.com/title/tt0708614/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 5 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 10,
    title: "Rapture",
    title_ja: "預言者シスコ",
    importance: 5,
    netflix_id: 70205913,
    netflix_synopsis: "ベイジョーの失われた伝説都市バハラを描いた絵に魅了されてしまったシスコ。命の危険も顧みずに、幻視を手がかりに史跡を見つけようとする。",
    url_imdb: "https://www.imdb.com/title/tt0708587/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 4 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 },
      { name: "Prophet", contrast: 5 }
    ]
  },
  {
    season: 5,
    episode: 11,
    title: "The Darkness and the Light",
    title_ja: "一人、また一人、そして…",
    importance: 3,
    netflix_id: 70205914,
    netflix_synopsis: "キラは昔のレジスタンス仲間が殺されたことを知る。コンピュータに残されたメッセージに不安を募らせるキラ。だが、これはまだ始まりに過ぎなかった。",
    url_imdb: "https://www.imdb.com/title/tt0708620/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 12,
    title: "The Begotten",
    title_ja: "幼き命",
    importance: 5,
    netflix_id: 70205915,
    netflix_synopsis: "出産の時が迫るキラ。一方、クワークから可変種の赤ん坊を買ったオドー。病気の赤ん坊の面倒を見ながら、成長に目を細めるオドーだったが...。",
    url_imdb: "https://www.imdb.com/title/tt0708616/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 5 },
      { name: "Keiko O'Brien", contrast: 4 },
      { name: "Shakaar", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 13,
    title: "For the Uniform",
    title_ja: "エディングトンの逆襲",
    importance: 5,
    netflix_id: 70205916,
    netflix_synopsis: "シスコは自分を裏切り、マキの仲間になったエディングトンを見つける。マキの企みを知ったシスコは阻止するためにやむなく無謀な手段に出ることに。",
    url_imdb: "https://www.imdb.com/title/tt0708544/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Michael Eddington", contrast: 5 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
      { name: "Maquis", contrast: 4 }
    ]
  },
  {
    season: 5,
    episode: 14,
    title: "In Purgatory's Shadow",
    title_ja: "敗れざる者 (前編)",
    importance: 4,
    netflix_id: 70205917,
    netflix_synopsis: "DS9はカーデシア人からだと思われる暗号メッセージをガンマ宇宙域から拾う。それが恩師からの救難信号だと知ったガラックは、彼の救出に向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708554/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 4 },
      { name: "Dukat", contrast: 4 },
      { name: "Ziyal", contrast: 4 },
      { name: "Martok", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 15,
    title: "By Inferno's Light",
    title_ja: "敗れざる者 (後編)",
    importance: 5,
    netflix_id: 70205918,
    netflix_synopsis: "DS9が攻撃に備える中、ドミニオンはカーデシアの方向へ進路を変え、デュカットの船も後に続く。カ―デシアは裏でドミニオンと手を組んでいたのだ。",
    url_imdb: "https://www.imdb.com/title/tt0708511/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 4 },
      { name: "Dukat", contrast: 5 },
      { name: "Ziyal", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Gowron", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 5 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 16,
    title: "Doctor Bashir, I Presume",
    title_ja: "ジュリアンの秘密",
    importance: 4,
    netflix_id: 70205919,
    netflix_synopsis: "宇宙艦隊のホログラムドクターのモデルに選ばれたベシア。適正確認のために開発者のジマーマンが身元調査を行うが、ベシアの秘密がそこで明らかに。",
    url_imdb: "https://www.imdb.com/title/tt0708527/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Leeta", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 17,
    title: "A Simple Investigation",
    title_ja: "オドーの恋",
    importance: 3,
    netflix_id: 70205920,
    netflix_synopsis: "オドーの目に留まった美しく観察力の鋭い女性。ステーションのコンピュータに侵入しようとした彼女をオドーは逮捕するが、次第に心惹かれてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708495/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 18,
    title: "Business as Usual",
    title_ja: "武器を売る者",
    importance: 3,
    netflix_id: 70205921,
    netflix_synopsis: "クワークは借金に苦しんでいた。そんな時、いとこから武器販売で儲ける話を持ちかけられる。命がけの危険な駆け引きでクワークの商才が光る。",
    url_imdb: "https://www.imdb.com/title/tt0708510/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3},
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 19,
    title: "Ties of Blood and Water",
    title_ja: "父死す",
    importance: 3,
    netflix_id: 70205922,
    netflix_synopsis: "キラはカーデシア反政府運動の指揮者ゲモールと再会する。キラは彼に新政府のドミニオン離脱を扇動してほしいと頼むが、ゲモールには死期が迫っていた。",
    url_imdb: "https://www.imdb.com/title/tt0708651/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Dukat", contrast: 3 },
      { name: "Weyoun", contrast: 3 },
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 20,
    title: "Ferengi Love Songs",
    title_ja: "愛の値段",
    importance: 3,
    netflix_id: 70205923,
    netflix_synopsis: "フェレンギ会計監査局から目をつけられたクワーク。悪いこと続きですっかり落胆し、安らぎを求めて母を訪ねる。母は意外な相手と恋仲になっていた。",
    url_imdb: "https://www.imdb.com/title/tt0708541/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Leeta", contrast: 4 },
      { name: "Zek", contrast: 4 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 5 }
    ]
  },
  {
    season: 5,
    episode: 21,
    title: "Soldiers of the Empire",
    title_ja: "我らクリンゴン",
    importance: 4,
    netflix_id: 70205924,
    netflix_synopsis: "カーデシアの境界付近で行方不明になった戦艦バモス。クリンゴン最高評議会よりバモスの捜索を命じられたマートク将軍は、ウォーフに同行を依頼する。",
    url_imdb: "https://www.imdb.com/title/tt0708603/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 5 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Martok", contrast: 5 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 22,
    title: "Children of Time",
    title_ja: "末裔の星",
    importance: 4,
    netflix_id: 70205925,
    netflix_synopsis: "帰還途中にダックスがエネルギー・バリアに覆われた惑星を調査したいと言う。エネルギーにより船内のシステムは故障し、キラが複製される事態に。",
    url_imdb: "https://www.imdb.com/title/tt0708516/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 5 }
    ]
    , organizations: [
    ]
  },
  {
    season: 5,
    episode: 23,
    title: "Blaze of Glory",
    title_ja: "最後のテロリスト",
    importance: 4,
    netflix_id: 70205926,
    netflix_synopsis: "シスコに秘密の通信が届く。マキの残党が報復のためカーデシアに大量のミサイルを発射したのだ。窮地に立たされたシスコは仇敵に助けを求める。",
    url_imdb: "https://www.imdb.com/title/tt0708506/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Michael Eddington", contrast: 5 },
      { name: "Martok", contrast: 3 },
      { name: "Nog", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 2 },
      { name: "Maquis", contrast: 5 }
    ]
  },
  {
    season: 5,
    episode: 24,
    title: "Empok Nor",
    title_ja: "眠れるステーション エムポック・ノール",
    importance: 3,
    netflix_id: 70205927,
    netflix_synopsis: "DS9の修理に必要なカーデシア製の部品を求め、カーデシアが放棄した宇宙ステーションに乗り込むオブライエン。そこは無人のはずだったが...。",
    url_imdb: "https://www.imdb.com/title/tt0708532/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 4 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 5,
    episode: 25,
    title: "In the Cards",
    title_ja: "プレゼント大作戦",
    importance: 3,
    netflix_id: 70205928,
    netflix_synopsis: "ジェイクはクワークのオークションのリストからシスコの好きな野球選手のカードを見つける。元気のない父親のためになんとか落札しようと考える。",
    url_imdb: "https://www.imdb.com/title/tt0708555/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 3 },
      { name: "Nog", contrast: 4 },
      { name: "Leeta", contrast: 2 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 }
    ]
  },
  {
    season: 5,
    episode: 26,
    title: "Call to Arms",
    title_ja: "DS9撤退の日",
    importance: 5,
    netflix_id: 70205929,
    netflix_synopsis: "ワームホールから次々と現れるジェム・ハダーの戦艦。アルファ宇宙域がドミニオンに占拠されつつあることに気づいたシスコは、苦渋の決断を下す。",
    url_imdb: "https://www.imdb.com/title/tt0708512/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 3 },
      { name: "Weyoun", contrast: 4 },
      { name: "Dukat", contrast: 4 },
      { name: "Rom", contrast: 4 },
      { name: "Nog", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Leeta", contrast: 3 },
      { name: "Ziyal", contrast: 3 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 5 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 1,
    title: "A Time to Stand",
    title_ja: "明日なき撤退",
    importance: 3,
    netflix_id: 70205930,
    netflix_synopsis: "ドミニオンとカーデシアを相手に戦況が悪化する中、援軍の期待も打ち砕かれるDS9一行。シスコは敵の生命線である施設を破壊する任務を与えられる。",
    url_imdb: "https://www.imdb.com/title/tt0708496/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 2 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 3 },
      { name: "Nog", contrast: 2 },
      { name: "Martok", contrast: 2 },
      { name: "Damar", contrast: 2 },
      { name: "Joseph Sisko", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 2,
    title: "Rocks and Shoals",
    title_ja: "洞窟の密約",
    importance: 3,
    netflix_id: 70205931,
    netflix_synopsis: "損傷したジェム・ハダー船で航行するシスコたち。地図にない星雲に突入し、惑星に不時着すると同時にダックスは負傷。そこでジェム・ハダーに捕まる。",
    url_imdb: "https://www.imdb.com/title/tt0708592/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 1 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 3 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 3,
    title: "Sons and Daughters",
    title_ja: "過去を越えた絆",
    importance: 3,
    netflix_id: 70205932,
    netflix_synopsis: "マートク将軍の補充要員に、疎遠になっていた息子アレキサンダーを見つけ当惑するウォーフ。兵士には向かない息子との溝をなんとか埋めたいと願う。",
    url_imdb: "https://www.imdb.com/title/tt0708604/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Dukat", contrast: 3 },
      { name: "Martok", contrast: 4 },
      { name: "Ziyal", contrast: 3 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 4,
    title: "Behind the Lines",
    title_ja: "レジスタンスの苦悩",
    importance: 3,
    netflix_id: 70205933,
    netflix_synopsis: "連邦の行動を監視していた敵の高度なセンサーを破壊するため、シスコは危険な戦術を使う。一方、キラたちのレジスタンス活動は思わぬ展開を見せる。",
    url_imdb: "https://www.imdb.com/title/tt0708505/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 1 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 3 },
      { name: "Rom", contrast: 4 },
      { name: "Nog", contrast: 2 },
      { name: "Damar", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 5,
    title: "Favor the Bold",
    title_ja: "ディープ・スペース・ナイン奪還作戦 (パート1)",
    importance: 4,
    netflix_id: 70205934,
    netflix_synopsis: "ドミニオンとカーデシアの艦隊にことごとく負け戦を強いられる連邦の士気は下がる一方だった。DS9を奪還するため、シスコはある作戦を計画する。",
    url_imdb: "https://www.imdb.com/title/tt0708540/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 2 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 3 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Ziyal", contrast: 3 },
      { name: "Damar", contrast: 3 },
      { name: "Leeta", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 6,
    title: "Sacrifice of Angels",
    title_ja: "ディープ・スペース・ナイン奪還作戦 (パート2)",
    importance: 5,
    netflix_id: 70205935,
    netflix_synopsis: "宇宙連邦を唯一守る存在の機雷原が破壊される中、シスコはDS9を取り返すために無謀としか言えないミッションの遂行を決死の覚悟で命じる。",
    url_imdb: "https://www.imdb.com/title/tt0708595/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 4 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 5 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Ziyal", contrast: 4 },
      { name: "Damar", contrast: 4 },
      { name: "Leeta", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 5 },
      { name: "Klingon", contrast: 4 }
    ]
  },
  {
    season: 6,
    episode: 7,
    title: "You Are Cordially Invited",
    title_ja: "花嫁の試練",
    importance: 3,
    netflix_id: 70205936,
    netflix_synopsis: "ウォーフとダックスがいよいよ結婚。だがその前に、ダックスはクリンゴンの家に入るために、マートクの妻シレラの審査に通らなければならない。",
    url_imdb: "https://www.imdb.com/title/tt0708667/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Martok", contrast: 3 },
      { name: "Leeta", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 8,
    title: "Resurrection",
    title_ja: "聖者の復活",
    importance: 3,
    netflix_id: 70205937,
    netflix_synopsis: "キラの死んだ恋人にそっくりの男が平行宇宙からやって来て、キラを人質に取る。逃亡犯であるというその男は、元の世界に戻ることを拒否する。",
    url_imdb: "https://www.imdb.com/title/tt0708589/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Bareil", contrast: 3 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 2 },
      { name: "Mirror Universe", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 9,
    title: "Statistical Probabilities",
    title_ja: "封じられた最終戦略",
    importance: 3,
    netflix_id: 70205938,
    netflix_synopsis: "遺伝子操作の過去が明らかになったベシアは、同じ経験を持つ者たちに協力することに。目的は社会に適応し、その優秀な頭脳を役立てることだった。",
    url_imdb: "https://www.imdb.com/title/tt0708606/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 2 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 1 }
    ]
  },
  {
    season: 6,
    episode: 10,
    title: "The Magnificent Ferengi",
    title_ja: "闘う交渉人フェレンギ",
    importance: 2,
    netflix_id: 70205939,
    netflix_synopsis: "ドミニオンの人質になった母親の救出を任されたクワーク。グランド・ネーガス・ゼクから高額の報酬を約束されたクワークは、弟と救出作戦を立てる。",
    url_imdb: "https://www.imdb.com/title/tt0708628/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Nog", contrast: 4 },
      { name: "Leeta", contrast: 2 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 11,
    title: "Waltz",
    title_ja: "不滅の悪意",
    importance: 5,
    netflix_id: 70205940,
    netflix_synopsis: "シスコがデュカットを戦争犯罪の調査会に移送中、宇宙艦がカーデシアによって攻撃される。苦悩に駆り立てられたデュカットは次第に正気を失って行く。",
    url_imdb: "https://www.imdb.com/title/tt0708660/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 2 },
      { name: "Dukat", contrast: 5 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 12,
    title: "Who Mourns for Morn?",
    title_ja: "モーンの遺産",
    importance: 3,
    netflix_id: 70205941,
    netflix_synopsis: "モーンがイオン嵐で事故死してしまった。悲しむ一同をよそに商機と見たクワークはバーで追悼式を開くが、莫大な遺産の相続人はなんとクワークだった。",
    url_imdb: "https://www.imdb.com/title/tt0708665/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 13,
    title: "Far Beyond the Stars",
    title_ja: "夢、遥かなる地にて",
    importance: 5,
    netflix_id: 70205942,
    netflix_synopsis: "親友戦死の報に落胆し、引退を考え始めたシスコ。そんな中、自分が人種差別の激しい1950年代のアメリカでSF作家になっている幻視を見る。",
    url_imdb: "https://www.imdb.com/title/tt0708538/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weeyun", contrast: 2 },
      { name: "Dukat", contrast: 2 },
      { name: "Martok", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Kasidy Yates", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 14,
    title: "One Little Ship",
    title_ja: "ルビコンの奇跡",
    importance: 3,
    netflix_id: 70205943,
    netflix_synopsis: "ダックスらは、亜空間圧縮現象により縮小されたランナバウトで調査に向かう。一方、ディファイアントがジェム・ハダーに占領されてしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708572/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Nog", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 15,
    title: "Honor Among Thieves",
    title_ja: "非情の捜査線",
    importance: 3,
    netflix_id: 70205944,
    netflix_synopsis: "犯罪組織オリオン・シンジケートに情報を流しているスパイを探るため、オブライエンは組織に潜入する。だが背後にはさらに恐ろしい敵の存在があった。",
    url_imdb: "https://www.imdb.com/title/tt0708550/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Orion Syndicate", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 16,
    title: "Change of Heart",
    title_ja: "至高の絆",
    importance: 2,
    netflix_id: 70205945,
    netflix_synopsis: "カーデシアの二重スパイの元に向かうダックスとウォーフ。その途中で暗号化された亜空間通信をスパイから受け取る。彼は亡命を希望していた。",
    url_imdb: "https://www.imdb.com/title/tt0708515/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 17,
    title: "Wrongs Darker than Death or Night",
    title_ja: "憎悪を越えて",
    importance: 5,
    netflix_id: 70205946,
    netflix_synopsis: "母親に関する秘密を知り、動揺するキラ。真相を探るべく、シスコに頼んで時の発光体の助けを借り、時間を遡ることに。そこにはさらに衝撃的な現実が。",
    url_imdb: "https://www.imdb.com/title/tt0708666/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 5 },
      { name: "Dukat", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 6,
    episode: 18,
    title: "Inquisition",
    title_ja: "記憶なきスパイ",
    importance: 4,
    netflix_id: 70205947,
    netflix_synopsis: "DS9で情報漏洩疑惑があり、調査のために内務監査局からスローン副長官が派遣される。上級士官は全員隔離され、自室で待機するように命じられる。",
    url_imdb: "https://www.imdb.com/title/tt0708559/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 19,
    title: "In the Pale Moonlight",
    title_ja: "消された偽造作戦",
    importance: 5,
    netflix_id: 70205948,
    netflix_synopsis: "犠牲者リストを見てため息をつくシスコ。戦争に勝つにはロミュランを連邦とクリンゴン連合の味方につけるしかない。究極の手段がシスコの良心を苛む。",
    url_imdb: "https://www.imdb.com/title/tt0708557/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 4 },
      { name: "Weyoun", contrast: 2 },
      { name: "Damar", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 6,
    episode: 20,
    title: "His Way",
    title_ja: "心をつなぐホログラム",
    importance: 4,
    netflix_id: 70205949,
    netflix_synopsis: "ベシア自慢の新しいホロスイート・キャラクター。それは60年代のラスベガスのクラブで、マティーニ片手に酔いしれる観客に歌を披露する歌手だった。",
    url_imdb: "https://www.imdb.com/title/tt0708548/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Vic Fontaine", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 21,
    title: "The Reckoning",
    title_ja: "善と悪の叫び",
    importance: 5,
    netflix_id: 70205950,
    netflix_synopsis: "選ばれし者への伝言が記された石版が発見され、ベイジョーから持ち帰ったシスコ。ダックスの解読によると、それは闘いが始まるというお告げだった。",
    url_imdb: "https://www.imdb.com/title/tt0708635/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Winn", contrast: 4 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 4 },
      { name: "Prophet", contrast: 5 }
    ]
  },
  {
    season: 6,
    episode: 22,
    title: "Valiant",
    title_ja: "過信",
    importance: 2,
    netflix_id: 70205951,
    netflix_synopsis: "フェレンギ星に向かう途中でノーグとジェイクはジェム・ハダーの攻撃を受ける。そこへ現れたアカデミー候補生のエリート部隊により2人は救出される。",
    url_imdb: "https://www.imdb.com/title/tt0708657/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 4 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 23,
    title: "Profit and Lace",
    title_ja: "グランド・ネーガスは永遠に",
    importance: 3,
    netflix_id: 70205952,
    netflix_synopsis: "憲章に男女平等の新条項を加えることを決めたグランド・ネーガス・ゼク。その政権を守るべく、女性蔑視のクワークがなぜか女性を代弁することに。",
    url_imdb: "https://www.imdb.com/title/tt0708582/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Quark", contrast: 5 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Leeta", contrast: 2 },
      { name: "Rom", contrast: 4 },
      { name: "Nog", contrast: 3 },
      { name: "Leeta", contrast: 3 },
      { name: "Zek", contrast: 4 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 5 }
    ]
  },
  {
    season: 6,
    episode: 24,
    title: "Time's Orphan",
    title_ja: "時の迷い子",
    importance: 3,
    netflix_id: 70205953,
    netflix_synopsis: "久しぶりに家族と再会したオブライエン。だがピクニックの最中、幼い娘モリーが時間の渦に落ちてしまう。救出されたものの、娘の様子に両親は戸惑う。",
    url_imdb: "https://www.imdb.com/title/tt0708652/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 5 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Keiko O'Brien", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 25,
    title: "The Sound of Her Voice",
    title_ja: "待っている女",
    importance: 3,
    netflix_id: 70205954,
    netflix_synopsis: "ディファイアントがリサ・キューザック艦長から救難信号を受信する。シスコたちは、脱出ポッドで辺境の惑星に不時着した彼女の救出に向かう。",
    url_imdb: "https://www.imdb.com/title/tt0708642/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 6,
    episode: 26,
    title: "Tears of the Prophets",
    title_ja: "決意の代償",
    importance: 5,
    netflix_id: 70205955,
    netflix_synopsis: "宇宙艦隊がドミニオンを攻撃する時がついに来た。シスコはカーデシア侵攻の指揮官に任命されるが、預言者はシスコに謎めいた警告を与える。",
    url_imdb: "https://www.imdb.com/title/tt0708610/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 5 },
      { name: "Dax", contrast: 5 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 3 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 4 },
      { name: "Martok", contrast: 3 },
      { name: "Nog", contrast: 3 },
      { name: "Damar", contrast: 3 },
      { name: "Vic Fontaine", contrast: 2 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 3 },
      { name: "Trill", contrast: 3 },
      { name: "Cardassia", contrast: 4 },
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 1,
    title: "Image in the Sand",
    title_ja: "砂漠からの呼び声",
    importance: 5,
    netflix_id: 70205956,
    netflix_synopsis: "ダックスの死とワームホールの消滅から3ヵ月後、DS9の生活は大きく変化していた。地球に戻ったシスコは再び預言者からの幻視を見るようになる。",
    url_imdb: "https://www.imdb.com/title/tt0708552/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 5 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Weyoun", contrast: 2 },
      { name: "Damar", contrast: 2 },
      { name: "Martok", contrast: 3 },
      { name: "Nog", contrast: 2 },
      { name: "Vic Fontaine", contrast: 2 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 4 },
      { name: "Trill", contrast: 3 },
      { name: "Cardassia", contrast: 2 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 2,
    title: "Shadows and Symbols",
    title_ja: "預言者の呪縛",
    importance: 5,
    netflix_id: 70205957,
    netflix_synopsis: "シスコはダックスの新しいホスト、エズリと出会う。選ばれし者の発光体を求め、地球からタイリー星に旅立つシスコ一家に彼女も同行することになる。",
    url_imdb: "https://www.imdb.com/title/tt0708600/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Weyoun", contrast: 2 },
      { name: "Damar", contrast: 2 },
      { name: "Martok", contrast: 3 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 5 },
      { name: "Trill", contrast: 3 },
      { name: "Cardassia", contrast: 1 },
      { name: "Klingon", contrast: 1 }
    ]
  },
  {
    season: 7,
    episode: 3,
    title: "Afterimage",
    title_ja: "再生する魂",
    importance: 3,
    netflix_id: 70205958,
    netflix_synopsis: "エズリは、前のホストの記憶に戸惑ったり、仲間の自分に対するぎこちない態度に傷いていた。居場所を見つけられない彼女に手を差し伸べたのは...。",
    url_imdb: "https://www.imdb.com/title/tt0708498/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 5 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 5 }
    ]
    , organizations: [
      { name: "Trill", contrast: 3 },
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 4,
    title: "Take Me Out to the Holosuite",
    title_ja: "がんばれ、ナイナーズ!",
    importance: 3,
    netflix_id: 70205959,
    netflix_synopsis: "宇宙艦の修理のためにDS9に立ち寄ったバルカン人のソロック艦長。実はシスコとソロックには深い因縁があった。2人は野球で勝負をすることに。",
    url_imdb: "https://www.imdb.com/title/tt0708609/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Rom", contrast: 3 },
      { name: "Nog", contrast: 2 },
      { name: "Leeta", contrast: 2 },
      { name: "Kasidy Yates", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 5,
    title: "Chrysalis",
    title_ja: "愛に目覚める者",
    importance: 2,
    netflix_id: 70205960,
    netflix_synopsis: "遺伝子操作を受けたミュータントたちがベシアを訪ねてDS9に現れる。セレーナにベシアの治療を受けさせるため、研究所から脱走してきたようだ。",
    url_imdb: "https://www.imdb.com/title/tt0708518/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 6,
    title: "Treachery, Faith and the Great River",
    title_ja: "予期せぬ亡命者",
    importance: 5,
    netflix_id: 70205961,
    netflix_synopsis: "知人と偽り、オドーを呼び出したのは敵であるドミニオンのヴォルタ人リーダー、ウェイユンだった。彼がオドーに告げた要求は意外なもので...。",
    url_imdb: "https://www.imdb.com/title/tt0708654/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Weyoun", contrast: 4 },
      { name: "Damar", contrast: 2 },
      { name: "Martok", contrast: 2 },
      { name: "Nog", contrast: 3 },
      { name: "Rom", contrast: 2 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 1 },
      { name: "Klingon", contrast: 1 }
    ]
  },
  {
    season: 7,
    episode: 7,
    title: "Once More unto the Breach",
    title_ja: "今一度あの勇姿を",
    importance: 2,
    netflix_id: 70205962,
    netflix_synopsis: "クリンゴンの名将コールの突然の訪問に驚くウォーフ。野心のせいであちこちに敵を作ってしまったと話す、かつての英雄がウォーフに頼んだこととは。",
    url_imdb: "https://www.imdb.com/title/tt0708571/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Martok", contrast: 3 }
    ]
    , organizations: [
      { name: "Klingon", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 8,
    title: "The Siege of AR-558",
    title_ja: "戦争の影 －AR558攻防戦－",
    importance: 4,
    netflix_id: 70205963,
    netflix_synopsis: "星域最大のドミニオンの通信アンテナを死守する部隊と、彼らを支援するシスコたち。襲撃は激しさを増し、シスコのチームからも被害者が出てしまう。",
    url_imdb: "https://www.imdb.com/title/tt0708640/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 5 },
      { name: "Rom", contrast: 2 },
      { name: "Vic Fontaine", contrast: 2 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 9,
    title: "Covenant",
    title_ja: "裏切られた誓約",
    importance: 3,
    netflix_id: 70205964,
    netflix_synopsis: "キラはベイジョーの恩師との再会を喜ぶが、直後にエムポック・ノールに転送されてしまう。そこではデュカットがカルト集団の長として崇められていた。",
    url_imdb: "https://www.imdb.com/title/tt0708520/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Dukat", contrast: 4 }
    ]
    , organizations: [
      { name: "Pah-Wraiths", contrast: 1 }
    ]
  },
  {
    season: 7,
    episode: 10,
    title: "It's Only a Paper Moon",
    title_ja: "ペーパームーンに抱れて －戦争の影パート2－",
    importance: 4,
    netflix_id: 70205965,
    netflix_synopsis: "戦争で片足を失ったノーグがDS9に帰還した。仲間たちが元気づけようとするが、ノーグの傷は深い。そんな彼を立ち直らせたのは意外な人物だった。",
    url_imdb: "https://www.imdb.com/title/tt0708562/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 1 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Nog", contrast: 4 },
      { name: "Rom", contrast: 3 },
      { name: "Leeta", contrast: 2 },
      { name: "Vic Fontaine", contrast: 4 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 11,
    title: "Prodigal Daughter",
    title_ja: "崩れゆく家族の肖像",
    importance: 2,
    netflix_id: 70205966,
    netflix_synopsis: "オブライエンは内緒で行ったニュー・シドニーで行方不明になり、それを知ったシスコは激怒。現地に実家があるというエズリに捜索を頼むことに。",
    url_imdb: "https://www.imdb.com/title/tt0708581/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 1 }
    ]
  },
  {
    season: 7,
    episode: 12,
    title: "The Emperor's New Cloak",
    title_ja: "平行世界に消えたゼク",
    importance: 2,
    netflix_id: 70205967,
    netflix_synopsis: "フェレンギの長にしてクワークの母の恋人、グランド・ネーガス・ゼクが出張先の平行宇宙で行方不明に。遮蔽装置が欲しい同盟軍に捕らわれたのだ。",
    url_imdb: "https://www.imdb.com/title/tt0708623/",
    characters: [
      { name: "Benjamin Sisko", contrast: 1 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 1 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 1 },
      { name: "Kira Nerys", contrast: 1 },
      { name: "Garak", contrast: 1 },
      { name: "Rom", contrast: 4 },
      { name: "Martok", contrast: 2 },
      { name: "Leeta", contrast: 1 },
      { name: "Zek", contrast: 3 }
    ]
    , organizations: [
      { name: "Ferengi", contrast: 3 },
      { name: "Mirror Universe", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 13,
    title: "Field of Fire",
    title_ja: "眠らぬ殺意",
    importance: 2,
    netflix_id: 70205968,
    netflix_synopsis: "DS9で士官射殺事件が起きる。凶器は宇宙艦隊試作のTR-116ライフルだった。捜査が行き詰まる中、犯人を見つけたいエズリは禁断の方法をとる。",
    url_imdb: "https://www.imdb.com/title/tt0708542/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 2 }
    ]
    , organizations: [
      { name: "Trill", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 14,
    title: "Chimera",
    title_ja: "仮面の下の孤独",
    importance: 2,
    netflix_id: 70205969,
    netflix_synopsis: "偶然見かけたオドーを追ってDS9にやって来た可変種のラーズ。久々に出逢う同種に喜ぶオドーだが、固形種を蔑視するラーズは次々と問題を起こす。",
    url_imdb: "https://www.imdb.com/title/tt0708517/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 5 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 15,
    title: "Badda-Bing, Badda-Bang",
    title_ja: "アドリブ作戦で行こう!",
    importance: 2,
    netflix_id: 70205971,
    netflix_synopsis: "ヴィックの店にギャングのフランキーが出現。驚くオブライエンとベシアの前で店はギャングに乗っ取られる。店を取り返すため総力戦が繰り広げられる。",
    url_imdb: "https://www.imdb.com/title/tt0708502/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 1 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 3 },
      { name: "Nog", contrast: 3 },
      { name: "Vic Fontaine", contrast: 3 }
    ]
    , organizations: [
    ]
  },
  {
    season: 7,
    episode: 16,
    title: "Inter Arma Enim Silent Leges",
    title_ja: "闇からの指令",
    importance: 4,
    netflix_id: 70205973,
    netflix_synopsis: "謎に包まれた艦隊の諜報機関、セクション31。ベシアを訪れたスローンはセクション31からの指令を与える。それはロミュラン高官の情報収集だった。",
    url_imdb: "https://www.imdb.com/title/tt0708560/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 2 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Garak", contrast: 2 }
    ]
    , organizations: [
      { name: "Federation", contrast: 3 },
      { name: "Romulan", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 17,
    title: "Penumbra",
    title_ja: "彷徨う心",
    importance: 4,
    netflix_id: 70205976,
    netflix_synopsis: "シスコがベイジョーの土地に家を建てる夢に耽っていると、ウォーフが激戦の中で行方不明になったという報告が入る。エズリは単独で捜索することに。",
    url_imdb: "https://www.imdb.com/title/tt0708579/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 5 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Kasidy Yates", contrast: 5 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 5 },
      { name: "Damar", contrast: 4 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 3 },
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 18,
    title: "'Til Death Do Us Part",
    title_ja: "偽りの契り",
    importance: 5,
    netflix_id: 70205978,
    netflix_synopsis: "結婚について否定的な預言者にシスコが戸惑う中、カイ・ウィンが式を手伝いにDS9に到着する。ベイジョー人に変装したデュカットがウィンに接近。",
    url_imdb: "https://www.imdb.com/title/tt0708492/",
    characters: [
      { name: "Benjamin Sisko", contrast: 5 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 4 },
      { name: "Jake Sisko", contrast: 2 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 4 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 4 },
      { name: "Damar", contrast: 4 },
      { name: "Nog", contrast: 2 },
      { name: "Winn", contrast: 5 }
    ]
    , organizations: [
      { name: "Prophet", contrast: 3 },
      { name: "Bajor", contrast: 3 },
      { name: "Cardassia", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 19,
    title: "Strange Bedfellows",
    title_ja: "決別の行方",
    importance: 5,
    netflix_id: 70205980,
    netflix_synopsis: "ウォーフとエズリが転送されたジェム・ハダー船。そこでは女性可変種とソット・ゴーによる、戦争を終結に導く条約調印の準備が進められていた。",
    url_imdb: "https://www.imdb.com/title/tt0708607/",
    characters: [
      { name: "Benjamin Sisko", contrast: 2 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Kasidy Yates", contrast: 2 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 4 },
      { name: "Damar", contrast: 5 },
      { name: "Martok", contrast: 3 },
      { name: "Winn", contrast: 5 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 3 },
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 20,
    title: "The Changing Face of Evil",
    title_ja: "変節の時",
    importance: 5,
    netflix_id: 70205983,
    netflix_synopsis: "ウォーフとエズリ帰還の喜びも束の間、ブリーンが地球の艦隊司令部を攻撃したという知らせが入る。ダマールは母星解放のために立ち上がることを決意。",
    url_imdb: "https://www.imdb.com/title/tt0708617/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 2 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 2 },
      { name: "Quark", contrast: 2 },
      { name: "Bashir", contrast: 2 },
      { name: "Kira Nerys", contrast: 2 },
      { name: "Kasidy Yates", contrast: 3 },
      { name: "Weyoun", contrast: 3 },
      { name: "Dukat", contrast: 4 },
      { name: "Damar", contrast: 5 },
      { name: "Martok", contrast: 2 },
      { name: "Nog", contrast: 2 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Federation", contrast: 5 },
      { name: "Bajor", contrast: 2 },
      { name: "Klingon", contrast: 2 },
      { name: "Cardassian", contrast: 4 },
    ]
  },
  {
    season: 7,
    episode: 21,
    title: "When It Rains...",
    title_ja: "嵐の予兆",
    importance: 4,
    netflix_id: 70205986,
    netflix_synopsis: "ダマールの反乱を支持するため、シスコはキラに反乱軍の訓練を指示する。発病したオドーのために治療法を探すベシアは驚くべき事実を知ることに。",
    url_imdb: "https://www.imdb.com/title/tt0708663/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 3 },
      { name: "Dukat", contrast: 3 },
      { name: "Damar", contrast: 4 },
      { name: "Martok", contrast: 3 },
      { name: "Winn", contrast: 3 }
    ]
    , organizations: [
      { name: "Bajor", contrast: 2 },
      { name: "Cardassia", contrast: 4 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 22,
    title: "Tacking into the Wind",
    title_ja: "嵐に立つ者たち",
    importance: 5,
    netflix_id: 70205988,
    netflix_synopsis: "カーデシア反乱軍に戦術を説き伏せるキラの元に、活動の中核を担うオドーが帰ってきた。創設者を蝕む病気に感染した彼の容態は急速に悪化していた。",
    url_imdb: "https://www.imdb.com/title/tt0708608/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Garak", contrast: 3 },
      { name: "Damar", contrast: 4 },
      { name: "Martok", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 },
      { name: "Klingon", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 23,
    title: "Extreme Measures",
    title_ja: "心の決死圏",
    importance: 4,
    netflix_id: 70205990,
    netflix_synopsis: "キラは瀕死のオドーをDS9に連れ戻すが、彼に諭されてカーデシアに再び向かう。治療法を見つけるため、オブライエンとベシアは決死の作戦に出る。",
    url_imdb: "https://www.imdb.com/title/tt0708535/",
    characters: [
      { name: "Benjamin Sisko", contrast: 3 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 2 },
      { name: "Miles O'Brien", contrast: 4 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 3 },
      { name: "Garak", contrast: 3 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 3 }
    ]
  },
  {
    season: 7,
    episode: 24,
    title: "The Dogs of War",
    title_ja: "自由への叫び",
    importance: 4,
    netflix_id: 70205993,
    netflix_synopsis: "新生ディファイアントの指揮を任されたシスコ。一方、キラ、ガラック、ダマールは味方の裏切りに遭い、やっとの思いでドミニオンの攻撃から逃げる。",
    url_imdb: "https://www.imdb.com/title/tt0708622/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 3 },
      { name: "Worf", contrast: 3 },
      { name: "Dax", contrast: 4 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 4 },
      { name: "Bashir", contrast: 4 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Kasidy Yates", contrast: 4 },
      { name: "Garak", contrast: 4 },
      { name: "Weyoun", contrast: 3 },
      { name: "Rom", contrast: 4 },
      { name: "Damar", contrast: 4 },
      { name: "Martok", contrast: 2 },
      { name: "Leeta", contrast: 3 },
      { name: "Nog", contrast: 3 },
      { name: "Zek", contrast: 4 }
    ]
    , organizations: [
      { name: "Cardassia", contrast: 4 },
      { name: "Klingon", contrast: 2 },
      { name: "Ferengi", contrast: 2 }
    ]
  },
  {
    season: 7,
    episode: 25,
    title: "What You Leave Behind",
    title_ja: "終わりなきはじまり",
    importance: 5,
    netflix_id: 70205995,
    netflix_synopsis: "シスコの指揮下でディファイアントが連邦、クリンゴン、ロミュランの艦隊に参戦し、カーデシア侵攻が始まる。ついに訪れる、最後の旅立ちの時。",
    url_imdb: "https://www.imdb.com/title/tt0394907/",
    characters: [
      { name: "Benjamin Sisko", contrast: 4 },
      { name: "Odo", contrast: 4 },
      { name: "Worf", contrast: 4 },
      { name: "Dax", contrast: 3 },
      { name: "Jake Sisko", contrast: 3 },
      { name: "Miles O'Brien", contrast: 3 },
      { name: "Quark", contrast: 3 },
      { name: "Bashir", contrast: 3 },
      { name: "Kira Nerys", contrast: 4 },
      { name: "Keiko O'Brien", contrast: 3 },
      { name: "Kasidy Yates", contrast: 3 },
      { name: "Weyoun", contrast: 3 },
      { name: "Garak", contrast: 4 },
      { name: "Dukat", contrast: 4 },
      { name: "Damar", contrast: 4 },
      { name: "Nog", contrast: 3 },
      { name: "Martok", contrast: 3 },
      { name: "Leeta", contrast: 2 },
      { name: "Vic Fontaine", contrast: 3 },
      { name: "Winn", contrast: 4 }
    ]
    , organizations: [
      { name: "Federation", contrast: 5 },
      { name: "Bajor", contrast: 3 },
      { name: "Prophet", contrast: 5 },
      { name: "Cardassia", contrast: 5 },
      { name: "Klingon", contrast: 5 },
      { name: "Dominion", contrast: 5 }
    ]
  }
]
