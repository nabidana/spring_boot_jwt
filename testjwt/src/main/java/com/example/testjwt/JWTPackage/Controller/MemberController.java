package com.example.testjwt.JWTPackage.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.testjwt.JWTPackage.Domain.MemberLoginRequestDTO;
import com.example.testjwt.JWTPackage.Domain.TokenInfo;
import com.example.testjwt.JWTPackage.Service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {
    private final MemberService memberService;

    @PostMapping("/login")
    public TokenInfo login(
        @RequestBody MemberLoginRequestDTO memberLoginRequestDTO
    ){
        //log.info("START");
        String memberId = memberLoginRequestDTO.getMemberId();
        //log.info("ID: "+memberId);
        String password = memberLoginRequestDTO.getPassword();
        //log.info("PWD: "+ password);
        TokenInfo tokenInfo = memberService.login(memberId, password);
        //log.info("FINISH");
        return tokenInfo;
    }

    @PostMapping("/test")
    public String test(){
        return "success";
    }
    
}
