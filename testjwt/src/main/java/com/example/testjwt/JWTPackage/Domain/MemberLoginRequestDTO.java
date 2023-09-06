package com.example.testjwt.JWTPackage.Domain;

import lombok.Data;

@Data
public class MemberLoginRequestDTO {
    private String memberId;
    private String password;
}
