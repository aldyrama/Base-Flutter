enum APIState { MOCK, STAGING,PRODUCTION }

///your base_url
String MOCK_API =  "http://private-9936c-appscheftrialapi.apiary-mock.com/";
String STAGING_API =  "https://private-4f4db-alacarteapiary.apiary-mock.com/";
String PRODUCTION_API = "https://private-4f4db-alacarteapiary.apiary-mock.com/";

APIState currentState = APIState.MOCK;

///this is a function for the base url
String BASE_URL() {
  switch (currentState) {
    case APIState.MOCK:
      return MOCK_API;
    case APIState.STAGING:
      return STAGING_API;
    case APIState.PRODUCTION:
      return PRODUCTION_API;
  }
}

class NetworkEndpoints {
  ///add your endpoint in this class
  final String login = "login";
  final String product = "products?page=3";
}