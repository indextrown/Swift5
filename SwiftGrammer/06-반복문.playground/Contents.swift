/*
 
 (23강) 반복문
 
 반복문
 - for문
 - while문
 - repeat-while문

 프로그래밍 기본 원리
 - 모든 프로그램은 아래의 세가지 논리로 이루어 진다
 - 순차: 코드 작성 순서대로 진해된다
 - 조건: if문, switch문을 통해 어떤 조건일 때 어떤 코드를 실행
 - 반복: 어떤 동작을 반복해서 시키는 것(for, whule)
 
 for문
 - for문에 들어가는 상수: 반복상수
 - _: 와일드카드패턴: 생략역할
 - 문자열에서도 사용 가능
 
 배열
 - 데이터 바구니 또는 collection 이라고 함
 - 반복문이랑 결합하여 주로 사용한다
 
 stride
 - (from: 1, to: 10, by: 2)
 -> 1부터 10 미만 까지 걷는데 2씩 증가
 
 
 
 
 
 (24강) for문 사용시 주의점
 - 내부에서 사용하는 반복 상수는 밖에서 절대 출력 할 수 없다
 - 중괄호 내부에서는 밖에서 선언된 변수 접근 가능하다
 
 
 
 
 
 (25강) 반복문의 제어전송문   continue, break
 
 for
 - 반복횟수를 미리 알거나 컬렉션, 범위 등을 이용할 때
 
 while
 - 반봇횟수가 미리 정해져 있지 않고 조건에 따라 바뀔 때
 
 제어전송문
 - 코드의 실행 흐름에서 제어를 어떤 곳으로 넘겨 버리는 것이다
 - continue: 반복문의 지금 주기를 끝내고 다음 주기로 이어간다
 - break: 반복문을 종료시킨다
 - 둘다 가장 가까운 반복문을 종료시킨다

 정리
 - 제어전송문: 가장 인접한 반복문 주기를 다음 주기로 넘기거나 종료시킨다
 - continue, break 같은 제어전송문은 가장 가까이 있는 반복문을 종료시킨다
 
 
 */


for i in 1...10 {
    print(i)
}

for i in "hello" {
    print(i)
}

for i in stride(from: 1, to: 10, by:2) {
    print(i)
}

for i in 0..<5 {
    for j in 0...i {
        print("*", terminator: "")
    }
    print()
}
