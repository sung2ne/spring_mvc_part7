package com.example.spring.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
    
    @Autowired
    private SqlSession sqlSession;
    
    // 사용자 등록
    public int create(UserVo userVo) {
        return sqlSession.insert("userMapper.create", userVo);
    }

    // 사용자 정보
    public UserVo read(UserVo userVo) {
        return sqlSession.selectOne("userMapper.read", userVo);
    }

    // 사용자 수정
    public int update(UserVo userVo) {
        return sqlSession.update("userMapper.update", userVo);
    }
}