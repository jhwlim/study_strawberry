package com.study.strawberry.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 	# 테스트용 컨트롤러, 추후 삭제 필요
 */
@Controller
public class TestController {
	
	@GetMapping("/notice/write")
	public void test() {
	}
	
}
