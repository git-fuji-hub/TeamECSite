set names utf8;
set foreign_key_checks = 0;

drop database if exists jupiter;
create database if not exists jupiter;

use jupiter;

drop table if exists user_info;
create table user_info(
	id int primary key not null auto_increment,
	user_id varchar(16) not null unique,
	password varchar(16) not null,
	family_name varchar(32) not null,
	first_name varchar(32) not null,
	family_name_kana varchar(32) not null,
	first_name_kana varchar(32) not null,
	sex tinyint default 0,
	email varchar(32),
	status tinyint default 0,
	logined tinyint default 0 not null,
	regist_date datetime,
	update_date datetime
);

INSERT INTO user_info VALUES
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

drop table if exists product_info;
create table product_info(
	id int primary key not null auto_increment,
	product_id int not null unique,
	product_name varchar(100) not null unique,
	product_name_kana varchar(100) not null unique,
	product_description varchar(255),
	category_id int not null,
	price int not null,
	image_file_path varchar(100) not null,
	image_file_name varchar(50) not null,
	release_date datetime,
	release_company varchar(50),
	status tinyint default 1,
	regist_date datetime,
	update_date datetime,
	foreign key(category_id)
	references m_category(category_id)
);

INSERT INTO product_info VALUES
(1,1,"サッポロ黒ラベル [ 350ml×24本 ]","さっぽろくろらべる","サッポロビールの看板商品「サッポロ生ビール黒ラベル」。<br>フレッシュな口当たりと独自に育種した“旨さ長持ち麦芽”を使用したこのビールは、<br>キレ、コク、苦みが三位一体となってダイレクトに楽しめる爽快な1本です。",2,4605,"./images","kurolabel.jpg","1997-4-1","	サッポロビール",0,now(),now()),
(2,2,"サントリー ザ・プレミアム・モルツ [ 350ml×24本 ]","さんとりーざぷれみあむもるつ","香ばしさを抑えた甘い香りの黒麦芽とともに、<br>ホップには華やかな香りの欧州産アロマホップを使用。<br>まろやかで豊かなコクと味わいを実現しています。",2,5378,"./images","premiummalts.jpg","2003-5-20","サントリー",0,now(),now()),
(3,3,"アサヒ スーパードライ[ 350ml×24本 ]","あさひ すーぱーどらい","1987年に日本初の辛口ビールとしてデビューするとともに、<br>日本ビール業界に革新を与えた衝撃作。雑味がないキレのある1杯は、<br>「洗練されたクリアな味・辛口」のキャッチフレーズを表現するのに相応しい味わいです。",2,4605,"./images","superdry.jpg","1987-3-1","	アサヒビール",0,now(),now()),
(4,4,"サッポロ ヱビス プレミアムエール [ 350ml×24本 ]","さっぽろ えびす ぷれみあむえーる","カスケードホップを一部使用、上面発酵製法で出来たエールタイプの新しいヱビスビールです。<br>厳選したホップ、カスケードを一部使用することで、濃密な香りと、凛とした苦みを実現しました。<br>上面発酵製法を採用し、ふくよかで豊かな香りを実現しました。麦芽１００％・長期熟成・欧州産麦芽一部使用。",2,5434,"./images","yebisu.jpg","2019-1-9","サッポロビール",0,now(),now()),
(5,5,"ヒューガルデン ホワイト [ 330ml ×24本 ]","ひゅーがるでん ほわいと","オレンジピールとコリアンダーシードの完璧な組み合わせが生み出す自然な苦味と、<br>特有の清涼感、華やかでスッキリとしたフレーバーは、<br>普段ビールを飲まない方や女性にもおすすめのホワイトビールです。",2,4605,"./images","hoegaarden.jpg","2016-1-19","Anheuser-Busch InBev Japan",0,now(),now()),
(6,6,"アイコン・ユーロパブ フラーズ ロンドン プライド [ 330ml×24 ]","あいこん・ゆーろぱぶ ふらーず ろんどん ぷらいど","驚くほどの、なめらかさと複雑な味わい、<br>ターゲット、チャレンジャー、ノースダウンの3種類のホップを使用し、<br>豊かな麦芽の風味との絶妙なバランスが特徴です。",2,9980,"./images","londonpride.jpg","2008-11-25","フラーズ社",0,now(),now()),

(7,7,"獺祭","だっさい","最高の酒米といわれる山田錦を45%まで磨いて醸した純米大吟醸。きれいで新鮮な味と柔らかで繊細な香りが絶妙なバランスを保っています。<br>何より、酒のある楽しい生活を提案する酒蔵であり続けたいと考えています。生活の、一つの道具として楽しんで頂ける酒を目指して、「獺祭」(だっさい)を醸しております。",3,3200,"./images","dassai.jpg","2013-2-20","旭酒造",0,now(),now()),
(8,8,"令和","れいわ","この度遠藤酒造場では、31年ぶりに制定される新たな元号の発表に合わせて、新しい時代の繁栄と発展を祈念して、新元号ラベルの特別な純米酒を限定販売いたします。 <br>ラベルは、白地に墨文字で新元号をシンプルに、かつ、ダイナミックに描きました。新たな時代の始まりにふさわしく、風格のあるデザインに仕上げております。 <br>この特別なオリジナルラベルは、当蔵自慢の「純米酒」にてご用意いたします",3,1200,"./images","reiwa.jpg","2019-4-3","遠藤酒造場",0,now(),now()),
(9,9,"白鶴","はくつる","灘本流の技が冴える、伝統の味わい。飲むほどに深まる円熟した本醸造酒の端正で豊かな味わいの正統派「灘酒」です。皆様の嗜好に幅広く柔軟に対応できる酒質です。<br>本醸造ならではの円熟した豊かな香りは、冷でも燗でも楽しんでいただけますが、寒い季節には燗で飲んでいただくことをお薦めします。",3,2300,"./images","hakuturu.jpg","1747-4-1","白鶴酒造",0,now(),now()),
(10,10,"臥龍梅","がりゅうばい","五百万石を精米歩合45％に至るまで磨き込んで仕込み、仕上げは袋吊りで上槽した純米大吟醸酒です。<br>酒造歴50有余年の南部杜氏、菅原富男が秘伝の技を尽くして仕込みました。キレのよい酒に仕上がる五百万石らしい、すっきりした辛口のお酒に仕上がっております。<br>晴れの日にご一献差し上げたい一品です。",3,6480,"./images","garyuu.jpg","1971-4-1","三和酒造",0,now(),now()),
(11,11,"十四代　純米大吟醸　龍月　七垂二十貫","りゅうげつ","近年の日本で人気の味である「芳醇旨口」な日本酒です。使用している愛山というお米と、組み合わさる数種類のお米、米麹の旨みと甘みが、奥行きのあるエレガントな香りと、後味に心地よい余韻を感じるお酒であり、飲みやすく多くの人から愛されています。数種類のお米の組み合わせには、「酒未来」「龍の落とし子」「羽州誉」の3種の酒米を作っており、時期や気候によって、さまざまなお米を使いわけながら米と酒の究極の味を見出しています。七垂に十貫は、1年で一番良質なものが出来上がる7月、10月のみ出荷されている限定品",3,201000,"./images","ryuugetu.jpg",now(),"高木酒造",0,now(),now()),
(12,12,"金鯱","きんしゃち","パーティー・結婚式・開店祝いなどなど様々なお祝いにかかせない一品です。<br>酒造好適米である「五百万石」を65％以下まで精白し、麹米に使用しました。<br> しっかりとした味わいと穏やかな風味がバランス良く調和が取れています。 <br>冷や（常温）から熱燗まで、幅広い飲用温度にてお楽しみ頂けます。",3,188888 ,"./images","kinsyati.jpg","2014-12-5","贈り物本舗じざけや",0,now(),now()),


(13,13,"黒霧島","くろきりしま","大正5年、霧島酒造創業者・江夏吉助によって初蔵出しされた焼酎は「黒麹」仕込み。<br>霧島酒造の歴史は、黒麹の焼酎で幕を開けたのです。創業当時の黒麹仕込みの味わいを<br>最新鋭の設備と当社独自の仕込みで再現した「黒霧島」。<br>黒麹の醸すうまさはトロッとしたあまみ、キリッとした後切れにあります。<br>霧島酒造の永きに渡る伝統と卓越した技術からこの美味しさはつくられているのです。",4,1800,"./images","kurokirishima.jpg","1998-6-1","霧島酒造",0,now(),now()),
(14,14,"極上 宝焼酎","ごくじょう たからしょうちゅう","極上＜宝焼酎＞はロックや水割りで飲んだときはまろやかに<br>、ミックスベースとした時は、割材の味を活かしながら、焼酎の味わいがしっかり感じられる酒質にするため、<br>樽貯蔵熟成酒の種類やブレンド比率について試行錯誤をした結果、<br>大麦とトウモロコシの樽貯蔵熟成酒を3％使用しました。<br>樽貯蔵熟成酒によるまろやかな口当たりと芳醇な味わいをお楽しみください。 ",4,2300,"./images","takara.jpg","2009-9-8","宝酒造",0,now(),now()),
(15,15,"天下泰平","てんかたいへい","天下泰平 本格米焼酎は普段聞きなれている黒麹や白麹ではなく、<br>清酒で使用する黄麹仕込みの焼酎です。<br>特徴としては、飲み口がやわらかく、アルコール度がストレートに<br>感じるロックなどでもやさしい口当たりが楽しめます。<br>また、華やかな米の香りと甘みが味わえる飲み飽きしない焼酎です。<br>ロックがおすすめですが、水割りではやさしい甘みが楽しめます。<br>飲めば納得の味わいとコストパフォーマンスが魅力です。",4,1800,"./images","tenka.jpg","2018-12-1","清洲桜醸造",0,now(),now()),
(16,16,"北海男爵","ほっかいだんしゃく","厳選した北海道特産の男爵いもを、大雪山系の清冽な水で磨き抜いてつくりあげた本格焼酎です。<br>豊かな風味とスッキリとした軽い飲み口が特長です。優れた品質、味の良さから、<br>[じゃがいもの王様]と折り紙つきの北海道特産「男爵いも」。<br>その豊かな風味をそのまま本格焼酎につくりあげました。<br>飲み口はスッキリ軽く、味わいはクセがなくまろやか。雄大な北海道が生んだ大らかなおいしさです。<br>夏はロック、冬はお湯割と、お好みでお楽しみください。",4,2800,"./images","danshaku.jpg","2011-9-27","合同酒精",0,now(),now()),
(17,17,"島の華 ","しまのはな","銅製のポットスチールの蒸留器を使い、<br>さらりとした口あたりの、麦焼酎です。<br>樫立酒造株式会社の創業は大正14年（1925年）です。<br>三原山の中腹に工場があり、緑に囲まれた環境の中で製造しています。<br>蒸留が焼酎の出来を大きく左右するという考えから、<br>特注で銅製のポットスチールの蒸留機を使い、麦を原料とした、<br>うまさを残した本格焼酎の製造を目指しています。",4,2000,"./images","shima.jpg","1997-5-1","樫立酒造",0,now(),now()),
(18,18,"ゆるび","ゆるび","酒造りの伝統技術を生かし手造りにこだわり仕込み蒸留した本格米焼酎です。<br>軽快ながらもお米の香味をしっかり引き出した焼酎です。<br> 誰もが楽しめる気軽で飲みやすい「お米のお酒」としてご提案。<br>シンプルに水やお湯割り、レモンやライムを浮かべて爽やかに、<br>果汁で割ってカクテルなど自分流の飲み方で楽しんでいただけます。<br>",4,1800,"./images","yurubi.jpg","2012-3-8","西野金陵",0,now(),now()),

(19,19,"響","ひびき","日本の四季、日本人の感性、日本の匠の技でつくられたウイスキーという響のコンセプトを体現した製品。<br>ハイボールなど様々な飲み方で愉しめる、柔らかくも奥深い味わい。<br>熟成年数にこだわらず、サントリーのウイスキーづくりの歴史のなかで培ってきた<br>多彩な原酒と匠の技でつくりあげられたこだわりの逸品<br>「サントリーウイスキー 響 JAPANESE HARMONY（ジャパニーズ ハーモニー）」。<br>華やかな香りと、奥深くもやわらかな味わいが特長です。",5,7200,"./images","hibiki.jpg","1989-4-1","サントリー",0,now(),now()),
(20,20,"ブラックニッカ クリア","ぶらっくにっか くりあ","クセのないかろやかな味わいの「ノンピート・モルト(ピートを使用せず乾燥させた、<br>ピート由来のスモーキーフレイバーのない大麦麦芽)」を、<br>ほど良い甘味や香味成分を持った良質のグレーンウイスキーとブレンドすることで、<br>クセのない味わいとスッキリした飲みやすさを実現しました。",5,4000,"./images","black.jpg","1956-4-1","アサヒビール",0,now(),now()),
(21,21,"サントリー ウイスキー ","さんとりー うぃすきー","「日本人の舌に合う日本のウイスキーをつくりたい」。<br>1937年、壽屋(現サントリー)創業者の鳥井信治郎が十数年かけて完成させたウイスキーが「角瓶」です。<br>その繊細な味わいは日本人の味覚を満足させ、当時の人々の心を豊かにしました。<br>その後70年以上にわたって日本の食卓で愛され続け、<br>2014年には過去最高販売数量を更新。国内NO.1ウイスキーとなりました。",5,1500,"./images","sw.jpg","1934-4-1","サントリー",0,now(),now()),
(22,22,"シングルモルトウイスキー 山崎","しんぐるもるとういすきー やまざき","新たな試みとして、当社が保有する多種多様な原酒の中から「ワイン樽貯蔵モルト」を使用し、<br>「山崎」を語る上で欠かすことのできない「ミズナラ樽貯蔵モルト」など複数の原酒とヴァッティングしました。<br>それぞれの個性が重なり合うことで生まれた、やわらかく華やかな香り、<br>甘くなめらかな味わいが特長です。ロック、ストレート、水割りもおすすめですが、<br>飲食店で人気のハイボールも是非お楽しみ下さい。",5,30000,"./images","yamazaki.jpg","1984-4-1","サントリー",0,now(),now()),
(23,23,"サントリー ローヤル","さんとりー ろーやる","日本のウイスキーの父・サントリー初代マスターブレンダー鳥井信治郎の名作。<br>瓶型は漢字の酉(酒の器)、栓は鳥居をかたどったもの。1960年の登場以来、<br>日本の高級ウイスキーの代名詞として、豊かな夜を開いてきました。<br>山崎パンチョン樽原酒と白州竹炭ろ過原酒がキーモルト。甘く華やかな香り。やわらかくなめらかな口あたり。すっきりと心地よい余韻が特長です。",5,3000,"./images","royal.jpg","1960-4-1","サントリー",0,now(),now()),
(24,24,"メーカーズマーク ","めーかーずまーく","アメリカ・ケンタッキー州の小さな蒸溜所から生まれる<br>「メーカーズマーク」は、最高品質のバーボンづくりを目指し、試行錯誤を重ねて誕生しました。<br>230年の伝統とノウハウを受け継ぐ、由緒あるバーボンウイスキーです。",5,2500,"./images","bw.jpg","1958-4-1","サントリー",0,now(),now());

drop table if exists cart_info;
create table cart_info(
	id int primary key not null auto_increment,
	user_id varchar(16) not null,
	product_id int not null,
	product_count int,
	price int,
	regist_date datetime,
	update_date datetime,
	foreign key(product_id)
	references product_info(product_id)
);

drop table if exists purchase_history_info;
create table purchase_history_info(
	id int primary key not null auto_increment,
	user_id varchar(16) not null,
	product_id int not null,
	product_count int,
	price int,
	destination_id int not null,
	regist_date datetime,
	update_date datetime,
	foreign key(user_id)
	references user_info(user_id),
	foreign key(product_id)
	references product_info(product_id),
	foreign key(destination_id)
	references destination_info(id)
);

drop table if exists destination_info;
create table destination_info(
	id int primary key not null auto_increment,
	user_id varchar(16) not null,
	family_name varchar(32) not null,
	first_name varchar(32) not null,
	family_name_kana varchar(32) not null,
	first_name_kana varchar(32) not null,
	email varchar(32),
	tel_number varchar(13),
	user_address varchar(50) not null,
	regist_date datetime,
	update_date datetime,
	foreign key(user_id)
	references user_info(user_id)
);

INSERT INTO destination_info VALUES
(1,"guest","インターノウス","テストユーざー","いんたーのうす","てすとゆーざー","guest@internous.co.jp","080-1234-5678","東京都千代田区三番町１ー１　ＫＹ三番町ビル１Ｆ",now(),now());

drop table if exists m_category;
create table m_category(
	id int primary key not null auto_increment,
	category_id int not null unique,
	category_name varchar(20) not null unique,
	category_description varchar(100),
	insert_date datetime not null,
	update_date datetime
);

INSERT INTO m_category VALUES
(1,1,"全てのカテゴリー","全てのカテゴリーが対象となります",now(), null),
(2,2,"ビール","ビールに関するカテゴリーが対象となります",now(),null),
(3,3,"日本酒","日本酒に関するカテゴリーが対象となります",now(),null),
(4,4,"焼酎","焼酎に関するカテゴリーが対象となります",now(),null),
(5,5,"ウィスキー","ウィスキーに関するカテゴリーが対象となります",now(),null);
