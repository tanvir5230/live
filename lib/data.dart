List companies = <Map>[
  {
    "country": 'Bangladesh',
    "city": "Dhaka",
    "developer": 'dev1',
    "agency": 'ag1',
    "agent": 'agent1',
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand1"
  },
  {
    "country": 'India',
    "city": "Delhi",
    "developer": 'dev2',
    "agency": 'ag2',
    "agent": "agent2",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand2"
  },
  {
    "country": 'Pakistan',
    "city": "karachi",
    "developer": 'dev3',
    "agency": 'ag3',
    "agent": "agent3",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand3"
  },
  {
    "country": 'srilanka',
    "city": "palle",
    "developer": 'dev4',
    "agency": 'ag4',
    "agent": "agent4",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand4"
  },
  {
    "country": 'Nepal',
    "city": "kathmundu",
    "developer": 'dev5',
    "agency": 'ag5',
    "agent": "agent5",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand5"
  },
  {
    "country": 'bhutan',
    "city": "thimpu",
    "developer": 'dev6',
    "agency": 'ag6',
    "agent": "agent6",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand6"
  },
  {
    "country": 'afganistan',
    "city": "afga",
    "developer": 'dev7',
    "agency": 'ag7',
    "agent": "agent7",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand7"
  },
  {
    "country": 'iraq',
    "city": "bagdad",
    "developer": 'dev8',
    "agency": 'ag8',
    "agent": "agent8",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand8"
  },
  {
    "country": 'egypt',
    "city": "kairo",
    "developer": 'dev9',
    "agency": 'ag9',
    "agent": "agent9",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand9"
  },
  {
    "country": 'turky',
    "city": "ankara",
    "developer": 'dev10',
    "agency": 'ag10',
    "agent": "agent10",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand10"
  },
  {
    "country": 'Bangladesh',
    "city": "Dhaka",
    "developer": 'dev11',
    "agency": 'ag11',
    "agent": "agent11",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand11"
  },
  {
    "country": 'Bangladesh',
    "city": "Dhaka",
    "developer": 'dev13',
    "agency": 'ag13',
    "agent": "agent13",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand11"
  },
  {
    "country": 'Bangladesh',
    "city": "Dhaka",
    "developer": 'dev12',
    "agency": 'ag12',
    "agent": "agent12",
    "brandLogo":
        'https://images.pexels.com/photos/170809/pexels-photo-170809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    "brandName": "brand12"
  }
];

Future<List> comData() async {
  List data = [];
  await Future.delayed(Duration(milliseconds: 500), () {
    data = companies;
  });
  return data;
}
