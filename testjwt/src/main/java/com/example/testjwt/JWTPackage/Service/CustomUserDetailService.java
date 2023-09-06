package com.example.testjwt.JWTPackage.Service;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.testjwt.JWTPackage.Domain.Member;
import com.example.testjwt.JWTPackage.JWTToken.JwtTokenProvider;
import com.example.testjwt.JWTPackage.Repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final MemberRepository memberRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return memberRepository.findByMemberId(username)
            .map(this::createUserDetails)
            .orElseThrow( () -> new UsernameNotFoundException("해당하는 사용자를 찾을 수 없습니다."));
    }
    
    //해당하는 사용자의 데이터가 존재한다면 userdetails 객체로 만들어서 리턴
    private UserDetails createUserDetails(Member member) {
        return User.builder()
            .username(member.getUsername())
            .password(passwordEncoder.encode(member.getPassword()))
            .roles(member.getRoles().toArray(new String[0]))
            .build();
    }
}
