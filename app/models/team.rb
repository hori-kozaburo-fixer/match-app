class Team < ActiveHash::Base
  self.data = [
    { id: 1, name: '秋田ノーザンハピネッツ', image: 'image/about01_02.png', coach: '前田顕蔵', home: 'CNAアリーナ', character: 'ビッキー', ranking: '東7位' },
    { id: 2, name: '横浜ビー・コルセアーズ', image: 'image/fl_club_primary.png', coach: 'カイル・ミリング', home: '横浜国際プール', character: 'コルス', ranking: '東10位' },
    { id: 3, name: '新潟アルビレックスBB', image: 'image/img_flag.gif', coach: 'アルベルト', home: 'シティホールプラザアオーレ長岡', character: 'アルード', ranking: '東8位' },
    { id: 4, name: '富山グラウジーズ', image: 'image/富山.png', coach: '浜口炎', home: '富山市総合体育館', character: 'グラッキー', ranking: '東3位' },
    { id: 5, name: 'レバンガ北海道', image: 'image/square_levanga_logo.png', coach: '宮永雄太', home: '北海きたえーる', character: 'レバード', ranking: '東9位' },
    { id: 6, name: '宇都宮ブレックス', image: 'image/ph00162920.png', coach: '安齋竜三', home: 'ブレックスアリーナ宇都宮', character: 'ブレッキー', ranking: '東1位' },
    { id: 7, name: '千葉ジェッツ', image: 'image/chibajets_logo_2018-01.png', coach: '大野篤史', home: '船橋アリーナ', character: 'ジャンボくん', ranking: '東2位' },
    { id: 8, name: 'アルバルク東京', image: 'image/alvark.png', coach: 'パヴィチェヴィッチ', home: '代々木第2体育館', character: 'ルーク', ranking: '東4位' },
    { id: 9, name: 'サンロッカーズ渋谷', image: 'image/sr.png', coach: '伊佐勉', home: '青山学院記念館', character: 'サンディー', ranking: '東6位' },
    { id: 10, name: '川崎ブレイブサンダース', image: 'image/201807022050_2-600x0.png', coach: '佐藤賢次', home: '川崎市とどろきアリーナ', character: 'ロウル', ranking: '東5位' },
    { id: 11, name: '三遠ネオフェニックス', image: 'image/_____________.png', coach: 'ヴィチェンティッチ', home: '豊橋市総合体育館', character: 'ダンカー', ranking: '西10位' },
    { id: 12, name: '滋賀レイクスターズ', image: 'image/logo.png', coach: 'ショーン・デニス', home: 'ウカルちゃんアリーナ', character: 'マグニー', ranking: '西6位' },
    { id: 13, name: '京都ハンナリーズ', image: 'image/京都.jpg', coach: '小川伸也', home: 'ハンナリーズアリーナ', character: 'はんニャリン', ranking: '西9位' },
    { id: 14, name: '大阪エヴェッサ', image: 'image/8FEcLku_.png', coach: '阿部達也', home: 'おおきにアリーナ舞洲', character: 'まいどくん', ranking: '西4位' },
    { id: 15, name: '琉球ゴールデンキングス', image: 'image/rg.png', coach: '藤田弘輝', home: '沖縄市体育館', character: 'ゴーディー', ranking: '西1位' },
    { id: 16, name: '信州ブレイブウォリアーズ', image: 'image/FPfXFwON_400x400.png', coach: '勝久マイケル', home: 'ホワイトリング', character: 'ブレアー', ranking: '西7位' },
    { id: 17, name: '島根スサノオマジック', image: 'image/島根.jpeg', coach: '前田顕蔵', home: 'CNAアリーナ', character: 'ビッキー', ranking: '西5位' },
    { id: 18, name: '広島ドラゴンフライズ', image: 'image/広島.png', coach: '堀田剛司', home: '広島サンプラザホール', character: 'モヒカンアビィ', ranking: '西8位' },
    { id: 19, name: 'シーホース三河', image: 'image/三河.png', coach: '鈴木貴美一', home: 'ウィングアリーナ刈谷', character: 'シーホースくん', ranking: '西2位' },
    { id: 20, name: '名古屋ダイヤモンドドルフィンズ', image: 'image/team-logo01.png', coach: '梶山信吾', home: 'ドルフィンズアリーナ', character: 'ディー・ディー', ranking: '西3位' },
    { id: 21, name: 'その他', image: 'image/その他.png', coach: '🏀', home: '🏀', character: '🏀', ranking: '🏀' }
  ]
end
