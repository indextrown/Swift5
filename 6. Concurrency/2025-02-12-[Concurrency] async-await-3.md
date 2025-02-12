---
title: "[Concurrency] async-await-3"
tags: 
- Concurrency
use_math: true
header: 
  teaser: 
---

## 1. 에러 처리

- 에러를 던지는 비동기 함수 정의

- 에러를 던질 수 있는 비동기함수 실행시 try await 

  ```swift
  func throwingGetImage() async throws -> UIImage? {
    	// 오래 걸리는 일..
      try await Task.sleep(for: .seconds(2))// 에러가 던질 수 있는 코드
    	return UIImage(systemName: "heart")
  }
  
  func asyncMethod() async throws -> String {
    	let result = try await otherMethod()
    	return result
  }
  
  Task {
    	// do-catch 처리하지 않아도 된다
    	let result = try await asyncMethod()
    	print(result)
  }
  ```

  

