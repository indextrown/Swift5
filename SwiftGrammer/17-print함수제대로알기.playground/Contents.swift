 /*
  
  (42-1강) print함수 제대로 알기/api에 대한 이해

  func print(_ item: Any..., sperator: String = " ", terminator: String = "\n")
  첫번쨰 파라미터
  - wildcard 패턴을 사용해서 argument label을 사용하지 않는다
  - 가변 파라미터를 가질 수 있다 즉 여러 개 값을 던져줄 수 있다
  
  두번째 파라미터(seprator)
  - 나누는, 분리하는 것
  - 기본값: "\n"

  세번째 파라미터(terminator)
  - 엔터의 의미로 생각 즉 다음 칸으로 넘어간다
  - 기본값: "\n"
  
  API
  - Application Programming Interface(응용 프로그래밍 인터페이스)
  - 인터페이스는 자판기에서의 버튼과 같은 것을 의미
  - 인터페이스는 사용자에게 편리하게 다룰 수 있도록 제공해주는 화면을 의미
  - 미리 만들어 놓은 함수나 기능
   
  인터페이스 종류 2가지
  애플이 미리 만들어 놓은 API
  - 특정한 동작/기능을 실행시키기 위해 애플이 미리 사용법을 정의(약속)해놓은 그대로 사용(특히 앱을 만들 때 프레임워크의 API 많이 사용됨)
  - print(), stride(), 문자열.count, UIButton()
  
  서버와 통신하기 위해 만드는 API
  - 서버와 데이터를 주고 받기 위해, 어떠한 빙식으로 요청하는지에 대한 규격(요청 방법)을 정하는 것
  - 기상청 오픈API를 이용하면 날씨정보를 가져와서 앱에서 보여줄 수 있음
  
  
  
  */
