
class CruiseDestination {
  final String appTitle;
  final String cruiseName;
  final String location;
  final String imagePath;
  final String imageCaption;
  final String description;

  final int initialStarCount;

  final DateTime initialVisitDate;
  final String initialTransportMode;

  const CruiseDestination({
    required this.appTitle,
    required this.cruiseName,
    required this.location,
    required this.imagePath,
    required this.imageCaption,
    required this.description,
    required this.initialStarCount,
    required this.initialVisitDate,
    required this.initialTransportMode,
  });

  static final CruiseDestination sample = CruiseDestination(
    appTitle: 'Sibu River Cruise & Heritage',
    cruiseName: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imagePath: 'assets/images/sibu_esplanade.jpg',
    imageCaption: 'Sibu Esplanade Landmark',

    description:
    "Experience the heart of Sibu along Malaysia's "
        "longest river, the Rajang. Cruise past historic "
        "temples, timber hubs, and traditional waterfront "
        "settlements, experiencing authentic Sarawakian "
        "hospitality.",

    initialStarCount: 43,
    initialVisitDate: DateTime(2026, 11, 15),
    initialTransportMode: 'Express Boat',
  );
}
