package com.example.testjwt.JWTPackage.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.testjwt.JWTPackage.Domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
    Optional<Member> findByMemberId(String username);
}
