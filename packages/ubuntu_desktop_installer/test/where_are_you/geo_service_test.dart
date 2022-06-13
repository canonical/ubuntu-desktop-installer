import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'geo_service_test.mocks.dart';

// ignore_for_file: type=lint

const kGeonameUrl = 'http://lookup.geoname.org';

@GenerateMocks([Dio, GeoSource])
void main() {
  test('service sources', () async {
    final source1 = MockGeoSource();
    when(source1.searchLocation('foo'))
        .thenAnswer((_) async => [copenhagen, gothenburg]);

    final source2 = MockGeoSource();
    when(source2.searchLocation('foo')).thenAnswer((_) async => [copenhagen]);

    final service = GeoService();
    expect(await service.searchLocation('foo'), []);
    verifyNever(source1.searchLocation('foo'));
    verifyNever(source2.searchLocation('foo'));

    service.addSource(source1);
    service.addSource(source2);

    expect(await service.searchLocation('foo'), [copenhagen, gothenburg]);
    verify(source1.searchLocation('foo')).called(1);
    verify(source2.searchLocation('foo')).called(1);

    service.removeSource(source1);
    expect(await service.searchLocation('foo'), [copenhagen]);
    verifyNever(source1.searchLocation('foo'));
    verify(source2.searchLocation('foo')).called(1);
  });

  test('cancel search', () async {
    final source1 = MockGeoSource();
    when(source1.searchLocation('foo')).thenAnswer((_) async => [gothenburg]);
    when(source1.cancelSearch()).thenAnswer((_) async {});

    final source2 = MockGeoSource();
    when(source2.searchLocation('foo')).thenAnswer((_) async => [gothenburg]);
    when(source2.cancelSearch()).thenAnswer((_) async {});

    final service = GeoService();
    service.addSource(source1);
    service.addSource(source2);
    service.searchLocation('foo');
    await service.cancelSearch();

    verify(source1.cancelSearch()).called(1);
    verify(source2.cancelSearch()).called(1);
  });

  test('timezones', () async {
    final source1 = MockGeoSource();
    when(source1.searchTimezone('foo'))
        .thenAnswer((_) async => [copenhagen, gothenburg]);

    final source2 = MockGeoSource();
    when(source2.searchTimezone('foo')).thenAnswer((_) async => [copenhagen]);

    final service = GeoService();
    expect(await service.searchTimezone('foo'), []);
    verifyNever(source1.searchTimezone('foo'));
    verifyNever(source2.searchTimezone('foo'));

    service.addSource(source1);
    service.addSource(source2);

    expect(await service.searchTimezone('foo'), [copenhagen, gothenburg]);
    verify(source1.searchTimezone('foo')).called(1);
    verify(source2.searchTimezone('foo')).called(1);

    service.removeSource(source1);
    expect(await service.searchTimezone('foo'), [copenhagen]);
    verifyNever(source1.searchTimezone('foo'));
    verify(source2.searchTimezone('foo')).called(1);
  });

  test('geoname search location', () async {
    final dio = MockDio();
    when(dio.get(
      kGeonameUrl,
      queryParameters: anyNamed('queryParameters'),
      cancelToken: anyNamed('cancelToken'),
    )).thenAnswer((_) async => jsonResponse(copenhagen));

    final geoname = Geoname(url: kGeonameUrl, geodata: geodata, dio: dio);

    expect(await geoname.searchLocation('foo'), [copenhagen]);
    verify(dio.get(
      kGeonameUrl,
      queryParameters: <String, String>{'query': 'foo'},
      cancelToken: anyNamed('cancelToken'),
    )).called(1);
  });

  test('geoname lang & release', () async {
    final dio = MockDio();
    when(dio.get(
      kGeonameUrl,
      queryParameters: anyNamed('queryParameters'),
      cancelToken: anyNamed('cancelToken'),
    )).thenAnswer((_) async => jsonResponse(copenhagen));

    final geoname = Geoname(
      url: kGeonameUrl,
      geodata: geodata,
      parameters: {
        'release': 'bar',
        'lang': 'baz',
      },
      dio: dio,
    );

    await geoname.searchLocation('foo');
    verify(dio.get(
      kGeonameUrl,
      queryParameters: <String, String>{
        'query': 'foo',
        'release': 'bar',
        'lang': 'baz',
      },
      cancelToken: anyNamed('cancelToken'),
    )).called(1);
  });

  test('geoname error', () async {
    final dio = MockDio();
    when(dio.get(
      kGeonameUrl,
      queryParameters: anyNamed('queryParameters'),
      cancelToken: anyNamed('cancelToken'),
    )).thenAnswer((_) async => errorResponse);

    final geoname = Geoname(
      url: kGeonameUrl,
      geodata: geodata,
      parameters: {
        'release': 'bar',
        'lang': 'baz',
      },
      dio: dio,
    );

    expect(await geoname.searchLocation('foo'), isEmpty);
  });

  test('invalid geoname data', () async {
    final dio = MockDio();
    when(dio.get(
      kGeonameUrl,
      queryParameters: anyNamed('queryParameters'),
      cancelToken: anyNamed('cancelToken'),
    )).thenAnswer((_) async => invalidResponse);

    final geoname = Geoname(url: kGeonameUrl, geodata: geodata, dio: dio);

    expect(await geoname.searchLocation('foo'), isEmpty);
  });

  test('geolocation copy with', () async {
    final copy1 = copenhagen.copyWith(
      admin: gothenburg.admin,
      country: gothenburg.country,
      longitude: gothenburg.longitude,
      timezone: gothenburg.timezone,
    );
    expect(copy1.name, copenhagen.name);
    expect(copy1.admin, gothenburg.admin);
    expect(copy1.country, gothenburg.country);
    expect(copy1.country2, copenhagen.country2);
    expect(copy1.latitude, copenhagen.latitude);
    expect(copy1.longitude, gothenburg.longitude);
    expect(copy1.timezone, gothenburg.timezone);

    final copy2 = gothenburg.copyWith(
      name: copenhagen.name,
      admin: copenhagen.admin,
      country: copenhagen.country,
      country2: copenhagen.country2,
      latitude: copenhagen.latitude,
      longitude: copenhagen.longitude,
      timezone: copenhagen.timezone,
    );
    expect(copy2, copenhagen);

    final copy3 = copenhagen.copyWith();
    expect(copy3, copenhagen);
  });

  test('geolocation string', () {
    final str = copenhagen.toString();
    expect(str.contains(copenhagen.runtimeType.toString()), isTrue);
    expect(str.contains(copenhagen.name!), isTrue);
    expect(str.contains(copenhagen.admin!), isTrue);
    expect(str.contains(copenhagen.country!), isTrue);
    expect(str.contains(copenhagen.country2!), isTrue);
    expect(str.contains(copenhagen.latitude!.toString()), isTrue);
    expect(str.contains(copenhagen.longitude!.toString()), isTrue);
    expect(str.contains(copenhagen.timezone!), isTrue);
  });

  test('geodata location search', () async {
    bool isHelsinki(result) =>
        result.name == 'Helsinki' &&
        result.admin == 'Uusimaa' &&
        result.country == 'Finland';

    bool isOslo(result) =>
        result.name == 'Oslo' &&
        result.admin == 'Oslo' &&
        result.country == 'Norway';

    bool isStockholm(result) =>
        result.name == 'Stockholm' &&
        result.admin == 'Stockholm' &&
        result.country == 'Sweden';

    await geodata
        .searchLocation('')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('os')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('ST')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('Hki')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('FIN')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('Norway')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchLocation('Uusimaa')
        .then((results) => expect(results, isEmpty));

    await geodata.searchLocation('oslo').then((results) {
      expect(results, contains(predicate<GeoLocation>(isOslo)));
      expect(results, isNot(contains(predicate<GeoLocation>(isHelsinki))));
      expect(results, isNot(contains(predicate<GeoLocation>(isStockholm))));
    });

    await geodata.searchLocation('STOCKHOLM').then((results) {
      expect(results, contains(predicate<GeoLocation>(isStockholm)));
      expect(results, isNot(contains(predicate<GeoLocation>(isOslo))));
      expect(results, isNot(contains(predicate<GeoLocation>(isHelsinki))));
    });

    await geodata.searchLocation(' Helsinki ').then((results) {
      expect(results, contains(predicate<GeoLocation>(isHelsinki)));
      expect(results, isNot(contains(predicate<GeoLocation>(isOslo))));
      expect(results, isNot(contains(predicate<GeoLocation>(isStockholm))));
    });
  });

  test('alternate names', () async {
    bool isHelsinki(result) =>
        result.name == 'Helsinki' &&
        result.admin == 'Uusimaa' &&
        result.country == 'Finland';

    bool isHelsingfors(result) =>
        result.name == 'Helsingfors' &&
        result.admin == 'Uusimaa' &&
        result.country == 'Finland';

    bool isOslo(result) =>
        result.name == 'Oslo' &&
        result.admin == 'Oslo' &&
        result.country == 'Norway';

    bool isDuplicateOslo(result) =>
        result.name == 'oslo' &&
        result.admin == 'Oslo' &&
        result.country == 'Norway';

    await geodata.searchLocation('helsingfors').then((results) {
      expect(results, isNot(contains(predicate<GeoLocation>(isHelsinki))));
      expect(results, contains(predicate<GeoLocation>(isHelsingfors)));
    });

    await geodata.searchLocation('oslo').then((results) {
      expect(results, contains(predicate<GeoLocation>(isOslo)));
      expect(results, isNot(contains(predicate<GeoLocation>(isDuplicateOslo))));
    });
  });

  test('geodata timezone search', () async {
    final dk = GeoLocation(
        country: 'Denmark', country2: 'DK', timezone: 'Europe/Copenhagen');
    final fi = GeoLocation(
        country: 'Finland', country2: 'FI', timezone: 'Europe/Helsinki');
    final no =
        GeoLocation(country: 'Norway', country2: 'NO', timezone: 'Europe/Oslo');
    final se = GeoLocation(
        country: 'Sweden', country2: 'SE', timezone: 'Europe/Stockholm');

    await geodata
        .searchTimezone('')
        .then((results) => expect(results, equals([dk, fi, no, se])));
    await geodata
        .searchTimezone(' ')
        .then((results) => expect(results, equals([dk, fi, no, se])));
    await geodata
        .searchTimezone('foo')
        .then((results) => expect(results, isEmpty));
    await geodata
        .searchTimezone('eu')
        .then((results) => expect(results, equals([dk, fi, no, se])));
    await geodata
        .searchTimezone('ST')
        .then((results) => expect(results, equals([se])));
    await geodata
        .searchTimezone('Europe')
        .then((results) => expect(results, equals([dk, fi, no, se])));
    await geodata
        .searchTimezone(' copenhagen ')
        .then((results) => expect(results, equals([dk])));
    await geodata
        .searchTimezone('STOCKHOLM')
        .then((results) => expect(results, equals([se])));
  });

  test('geodata json', () async {
    expect(
      await geodata.fromJson(<String, dynamic>{
        'name': 'Copenhagen',
        'admin1': 'Capital Region',
        'country': 'Denmark',
        'latitude': '55.67594',
        'longitude': '12.56553',
        'timezone': 'Europe/Copenhagen',
      }),
      copenhagen,
    );

    expect(
      await geodata.fromJson(<String, dynamic>{
        'latitude': 55.67594,
        'longitude': 12.56553,
      }),
      const GeoLocation(
        latitude: 55.67594,
        longitude: 12.56553,
      ),
    );
  });
}

const copenhagen = GeoLocation(
  name: 'Copenhagen',
  admin: 'Capital Region',
  country: 'Denmark',
  country2: 'DK',
  latitude: 55.67594,
  longitude: 12.56553,
  timezone: 'Europe/Copenhagen',
);

const gothenburg = GeoLocation(
  name: 'Göteborg',
  admin: 'Vastra Gotaland',
  country: 'Sweden',
  country2: 'SE',
  latitude: 57.70716,
  longitude: 11.96679,
  timezone: 'Europe/Stockholm',
);

Response jsonResponse(GeoLocation city) {
  return Response(
    data: '''
[
  {
    "name": "${city.name}",
    "admin1": "${city.admin}",
    "country": "${city.country}",
    "country2": "${city.country2}",
    "latitude": "${city.latitude}",
    "longitude": "${city.longitude}",
    "timezone": "${city.timezone}"
  }
]
''',
    statusCode: 200,
    requestOptions: RequestOptions(path: '/'),
  );
}

final errorResponse = Response(
  data: null,
  statusCode: 500,
  requestOptions: RequestOptions(path: '/'),
);

final invalidResponse = Response(
  data: 'invalid',
  statusCode: 200,
  requestOptions: RequestOptions(path: '/'),
);

final geodata = Geodata(
  loadCities: () => kCities,
  loadAdmins: () => kAdmins,
  loadCountries: () => kCountries,
  loadTimezones: () => kTimezones,
);

const kCities = r'''
3161732	Bergen	Bergen	BGO,Bargen,Berga,Bergen,Bergen (Hordaland Fylke),Bergena,Bergenas,Bergeno,Bergn,Bernken,Birgon,Bjoergvin,Björgvin,baragena,bargana,bei er gen,beleugen,bergeni,berugen,brghn,brgn,perkan,Μπέργκεν,Берген,ברגן,برغن,برگن,बार्गन,বারগেন,பேர்கன்,แบร์เกน,ბერგენი,ベルゲン,卑爾根,베르겐	60.39299	5.32415	P	PPLA	NO		46	4601			213585		20	Europe/Oslo	2021-07-30
2618425	Copenhagen	Copenhagen	CPH,Cobanhavan,Copenaga,Copenaghen,Copenaguen,Copenhaga,Copenhagen,Copenhague,Copenhaguen,Copenhaguen - Kobenhavn,Copenhaguen - København,Cóbanhávan,Hafnia,Kapehngagen,Kaupmannahoefn,Kaupmannahöfn,Keypmannahavn,Kjobenhavn,Kjopenhamn,Kjøpenhamn,Kobenhamman,Kobenhaven,Kobenhavn,Kodan,Kodaň,Koebenhavn,Koeoepenhamina,Koepenhamn,Kopenage,Kopenchage,Kopengagen,Kopenhaagen,Kopenhag,Kopenhaga,Kopenhage,Kopenhagen,Kopenhagena,Kopenhago,Kopenhāgena,Kopenkhagen,Koppenhaga,Koppenhága,Kòpenhaga,Köbenhavn,Köpenhamn,Kööpenhamina,København,Københámman,ge ben ha gen,khopenheken,kopanahagana,kopenahagena,kopenahegena,kopenhagen,kwbnhaghn,kwpnhgn,qwpnhgn,Κοπεγχάγη,Капэнгаген,Копенгаген,Копенхаген,Կոպենհագեն,קופנהאגן,קופנהגן,كوبنهاغن,كوپېنھاگېن,ܟܘܦܢܗܓܢ,कोपनहागन,কোপেনহাগেন,কোপেনহেগেন,โคเปนเฮเกน,ཀའོ་པེན་ཧ་ཀེན,კოპენჰაგენი,ኮፐንሀገን,ኮፕንሀግ,コペンハーゲン,哥本哈根,코펜하겐	55.67594	12.56553	P	PPLC	DK		17	101			1153615		14	Europe/Copenhagen	2012-11-26
2711537	Göteborg	Goeteborg	G'oteborg,GOT,Gautaborg,Geteborg,Geteborga,Geteborgas,Geuteborgo,Geŭteborgo,Gjoteborg,Gjotehbarg,Goeteborg,Goeteborq,Goteborg,Goteburg,Gotemburgo,Gotenburg,Gothembourg,Gothenburg,Gothoburgum,Gotnburg,Gottenborg,Göteborg,Göteborq,Gøteborg,Gēteborga,Nketempornk,ge de bao,ghwtnbrgh,gtbwrg,jwtnbrj,kx then beirk,yeteboli,yohateborya,yotebori,ywtbry,Γκέτεμποργκ,Гетеборг,Гьотеборг,Гётеборг,Гётэбарг,גטבורג,געטעבארג,جوتنبرج,غوتنبرغ,گووتھنبرگ,یوتبری,योहतेबोर्य,กอเทนเบิร์ก,გეტებორგი,ዬተቦርይ,ᐃᐅᑕᐳᕆ,ヨーテボリ,哥德堡,예테보리	57.70716	11.96679	P	PPLA	SE		28	1480			572799		10	Europe/Stockholm	2021-08-02
658225	Helsinki	Helsinki	Elsin'ki,Elsinki,Elzinki,Gel'sinki,HEL,Heilsinci,Heilsincí,Hel'sinki,Helsenkis,Helsingfors,Helsingi,Helsingia,Helsinki,Helsinkis,Helsinkium,Helsinko,Helsinky,Helsinqui,Helsinquia,Helsset,Helsínquia,Helsînkî,Helsėnkis,Hèlsinki,Khel'sinki,Khel'sinki osh,Khelsinki,Khelzinki,Lungsod ng Helsinki,Stadi,Xelsinki,Xélsinki,elcinki,hailasiki,he er xin ji,helasinki,helsingki,helsinki,herushinki,hlsnky,hlsnqy,hlsynky,hlsynqy,hylsynky,Èlzinki,Ħelsinki,Ελσίνκι,Гельсінкі,Хелзинки,Хелсинки,Хельсинки,Хельсинки ош,Хельсінкі,Ҳелсинкӣ,Һel'sinki,Һельсинки,Հելսինկի,הלסינקי,העלסינקי,هلسنكي,هلسنڪي,هلسینکی,هيلسينكى,هیلسینکی,ھێلسینکی,ہلسنکی,ہیلسنکی,ܗܠܣܢܩܝ,हेलसिंकी,हेल्सिन्की,হেলসিঙ্কি,ਹੈਲਸਿੰਕੀ,எல்சிங்கி,ಹೆಲ್ಸಿಂಕಿ,ഹെൽസിങ്കി,เฮลซิงกิ,ཧེལ་སིན་ཀི།,ဟယ်လ်ဆင်ကီမြို့,ჰელსინკი,ሄልሲንኪ,Ḥélsinki,ヘルシンキ,赫尔辛基,赫爾辛基,헬싱키	60.16952	24.93545	P	PPLC	FI		01	011	091		558457		26	Europe/Helsinki	2019-11-18
2692969	Malmö	Malmoe	MMA,Mal'mjo,Malm'o,Malme,Malmey,Malmo,Malmoe,Malmogia,Malmö,Malmø,Málmey,ma er mo,marume,Малме,Малмьо,Мальмё,מאלמה,マルメ,马尔莫,马尔默	55.60587	13.00073	P	PPLA	SE		27	1280			301706	10	12	Europe/Stockholm	2021-03-26
3143244	Oslo	Oslo	Asloa,Christiania,Kristiania,OSL,Ohoro,Osla,Oslas,Oslo,Oslo osh,Oslu,Osló,ajalo,ao si lu,asalo,aslw,awslw,osalo,oseullo,oslea,oslo,osuro,xxslo,ywslw,Òslo,Ósló,Ōhoro,Όσλο,Осла,Осло,Осло ош,Օսլո,אוסלו,أوسلو,ئوسلو,ئۆسلۆ,اسلو,اوسلو,ܐܘܣܠܘ,ओस्लो,অজলো,ওসলো,ਓਸਲੋ,ଅସଲୋ,ஒஸ்லோ,ഓസ്ലൊ,ออสโล,ཨོ་སི་ལོ།,အော့စလိုမြို့,ოსლო,ኦስሎ,オスロ,奥斯陆,오슬로	59.91273	10.74609	P	PPLC	NO		12	0301			580000		26	Europe/Oslo	2020-07-24
3413829	Reykjavík	Reykjavik	REK,Recwic,Refkiavik,Rehjkjavik,Reiciavicia,Reicivic,Reikiavik,Reikiavike,Reikjaveks,Reikjavik,Reikjavika,Reikjavikas,Reikjavīka,Reiquiavik,Reiquiavique,Rejk'javik,Rejkijavik,Rejkjavik,Rejkjaviko,Rekyavik,Reykiavica,Reykjavik,Reykjavikur,Reykjavík,Reykjavíkur,Reykjawik,Reykyabik,Reykyavik,Rèkyavik,Réicivíc,Rēcwīc,Rėikjavėks,kartuli,lei ke ya wei ke,leikyabikeu,re'ikiyabhika,reikyavuiku,rekavik,rekh ya wik,reki'avika,rekjabhika,rekjavika,rekyavika,reyikyavik,reykyavik,rykjawk,rykyafyk,rykyawk,rykyawyk,Ρέικιαβικ,Ρευκιαβικ,Рейкиявик,Рейкьявик,Рейкявик,Рейкявік,Рејкјавик,Рэйкявік,Ռեյկյավիկ,רייקיאוויק,רעקיאוויק,ريكيافيك,ریکجاوک,ریکیاوک,ریکیاویک,رېيكياۋىك,ڕێکیاڤیک,रेक्जाविक,रेक्याविक,রেইকিয়াভিক,ਰੇਕਿਆਵਿਕ,ରେକ୍ଜାଭିକ,ரெய்க்யவிக்,రేకవిక్,റെയിക്യാവിക്,เรคยาวิก,རེཀ་ཇ་བིཀ།,რეიკიავიკი,ქართული,ሬይኪያቪክ,レイキャヴィーク,雷克亞維克,雷克雅未克,雷克雅維克,레이캬비크	64.13548	-21.89541	P	PPLC	IS		39	0000			118918		37	Atlantic/Reykjavik	2019-09-05
3137115	Stavanger	Stavanger	SVG,Stafangur,Stavanger,Stavangera,Stavenger,sutavuangeru,Ставангер,スタヴァンゲル	58.97005	5.73332	P	PPLA	NO		14	1103			121610		15	Europe/Oslo	2018-03-15
2673730	Stockholm	Stockholm	Estocolm,Estocolme,Estocolmo,Estocolmu,Estocòlme,Estokolma,Estokolmo,Holmia,STO,Stakgol'm,Stjokolna,Stoccholm,Stoccolma,Stockholbma,Stockholm,Stockolm,Stocolm,Stocolma,Stocòlma,Stocólma,Stokcholme,Stokgol'm,Stokgol'm osh,Stokgolm,Stokhol'm,Stokholm,Stokholma,Stokholmas,Stokholmi,Stokholmo,Stokkholm,Stokkholmur,Stokkhólmur,Stokkolma,Stokol'ma,Stokolm,Stuculma,Stuokhuolms,Stócólm,Sztokholm,Sztokhòlm,Tukholma,astkhlm,satakahoma,seutogholleum,si de ge er mo,stak'hom,stakahoma,stokahoma,stwkhwlm,stwqhwlm,stxkholm,sutokkuhorumu,Štokholm,Στοκχόλμη,Стакгольм,Стокhольм,Стокгольм,Стокгольм ош,Стокольма,Стокхолм,Стокҳолм,Стёколна,Ստոկհոլմ,סטוקהולם,שטאקהאלם,استکهلم,ستوكهولم,ستۆکھۆڵم,سٹاکہوم,ܣܛܘܩܗܘܠܡ,स्टकहोम,स्टॉकहोम,स्तकहोम,স্টকহোম,ਸਟਾਕਹੋਮ,ஸ்டாக்ஹோம்,స్టాక్‌హోమ్,ಸ್ಟಾಕ್‍ಹೋಮ್,സ്റ്റോക്ക്‌ഹോം,สตอกโฮล์ม,སི་ཏོག་ཧོ་ལིམ།,စတော့ဟုမ်းမြို့,სტოკჰოლმი,ስቶኮልም,ᔅᑑᒃᓱᓪᒻ/stuukhulm,ストックホルム,斯德哥尔摩,斯德哥爾摩,스톡홀름,𐍃𐍄𐌿𐌺𐌺𐌰𐌷𐌿𐌻𐌼𐍃	59.32938	18.06871	P	PPLC	SE		26	0180			1515017		17	Europe/Stockholm	2019-11-28
634963	Tampere	Tampere	TMP,Tammerfors,Tammerforsia,Tampere,Tampereh,Tamperė,amabere,tambyry,tampele,tampere,tamprh,tan pei lei,tanpere,tmprh,Τάμπερε,Тампере,Тамперэ,Տամպերե,טמפרה,تامبيري,تامپره,تامپیرے,ٹیمپیر,तांपेरे,আমবেরে,ตัมเปเร,ტამპერე,タンペレ,坦佩雷,탐페레	61.49911	23.78712	P	PPLA	FI		06	064	837		202687		114	Europe/Helsinki	2019-09-05
3133880	Trondheim	Trondheim	Drontheim,Kaupangen,Kommun Trondheim,Nidaros,Nidrosia,THrandheimur,TRD,Troandin,Trondheim,Trondheimas,Trondhjem,Trondkhajm,Trondkhejm,Trongejm,Tronheima,Tronkhejm,Trontchaim,Truondheims,Truondhėims,te long he mu,teulonheim,thrx nd hem,toronhaimu,toronheimu,tronad'ehima,troneim,trwndhaym,trwndhyym,Þrándheimur,Τροντχαιμ,Τρόντχαιμ,Τρόντχαϊμ,Тронгейм,Трондхайм,Трондхејм,Тронхейм,טרונדהיים,تروندهايم,تروندهایم,ٹرونڈہائم,ট্রোনডেহিম,ทรอนด์เฮม,ტრონჰეიმი,トロンハイム,トロンヘイム,特隆赫姆,트론헤임	63.43049	10.39506	P	PPLA2	NO		21	5001			147139		18	Europe/Oslo	2021-02-27
633679	Turku	Turku	Abo,Aboa,TKU,Tourkou,Turcu,Turku,Turkù,Turu,Túrcú,touruku,trkw,tu er ku,tu rku,tuleuku,turku,twrkw,twrqw,Åbo,Τούρκου,Турку,Տուրկու,טורקו,ترکو,توركو,تورکو,तुर्कू,টুর্কু,ตุรกุ,တားကူးမြို့,ტურკუ,ቱርኩ,トゥルク,图尔库,圖爾庫,투르쿠	60.45148	22.26869	P	PPLA	FI		02	023	853		175945		22	Europe/Helsinki	2019-09-05
''';

const kAdmins = r'''
DK.17	Capital Region	Capital Region	6418538
FI.01	Uusimaa	Uusimaa	830709
IS.39	Capital Region	Capital Region	3426182
NO.12	Oslo	Oslo	3143242
SE.26	Stockholm	Stockholm	2673722
''';

const kCountries = r'''
#ISO	ISO3	ISO-Numeric	fips	Country	Capital	Area(in sq km)	Population	Continent	tld	CurrencyCode	CurrencyName	Phone	Postal Code Format	Postal Code Regex	Languages	geonameid	neighbours	EquivalentFipsCode
DK	DNK	208	DA	Denmark	Copenhagen	43094	5484000	EU	.dk	DKK	Krone	45	####	^(\d{4})$	da-DK,en,fo,de-DK	2623032	DE	
FI	FIN	246	FI	Finland	Helsinki	337030	5244000	EU	.fi	EUR	Euro	358	#####	^(?:FI)*(\d{5})$	fi-FI,sv-FI,smn	660013	NO,RU,SE	
IS	ISL	352	IC	Iceland	Reykjavik	103000	308910	EU	.is	ISK	Krona	354	###	^(\d{3})$	is,en,de,da,sv,no	2629691		
NO	NOR	578	NO	Norway	Oslo	324220	5009150	EU	.no	NOK	Krone	47	####	^(\d{4})$	no,nb,nn,se,fi	3144096	FI,RU,SE	
SE	SWE	752	SW	Sweden	Stockholm	449964	9555893	EU	.se	SEK	Krona	46	SE-### ##	^(?:SE)*(\d{5})$	sv-SE,se,sma,fi-SE	2661886	NO,FI	
''';

const kTimezones = r'''
CountryCode	TimeZoneId	GMT offset 1. Jan 2021	DST offset 1. Jul 2021	rawOffset (independant of DST)
DK	Europe/Copenhagen	1.0	2.0	1.0
FI	Europe/Helsinki	2.0	3.0	2.0
NO	Europe/Oslo	1.0	2.0	1.0
SE	Europe/Stockholm	1.0	2.0	1.0
''';
