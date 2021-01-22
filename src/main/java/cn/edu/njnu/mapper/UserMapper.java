package cn.edu.njnu.mapper;

import cn.edu.njnu.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    // 测试
    List<User> queryUserList();
    // 根据用户名查找用户
    User queryUserByName(String userName);
    // 根据邮箱查找用户
    User queryUserByEmail(String userEmail);
    // 根据用户名和密码查找用户
    User queryByNameAndPassword(String userName, String password);
    // 添加用户
    void addUser(User user);
}
