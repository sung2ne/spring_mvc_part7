package com.example.spring.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

public class UserController {

    @Autowired
    private UserService userService;

    // 사용자 등록
    @PostMapping("/user/create")
    public void create(@RequestBody UserVo userVo) {
        userService.create(userVo);
    }

    // 사용자 정보
    @GetMapping("/user/read")
    public UserVo read(@RequestBody UserVo userVo) {
        return userService.read(userVo);
    }
    
}
