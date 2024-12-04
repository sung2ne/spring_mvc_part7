package com.example.spring.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    
    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 사용자 등록
    public boolean create(UserVo userVo) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVo.getPasswd());
        userVo.setPasswd(encodedPassword);

        int result = userDao.create(userVo);
        return result > 0;
    }

    // 사용자 정보
    public UserVo read(UserVo userVo) {
        return userDao.read(userVo);
    }

    // 사용자 수정
    public boolean update(UserVo userVo) {
        int result = userDao.update(userVo);
        return result > 0;
    }

    // 비밀번호 수정
    public boolean updatePassword(UserVo userVo) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(userVo.getPasswd());
        userVo.setPasswd(encodedPassword);

        int result = userDao.update(userVo);
        return result > 0;
    }
}