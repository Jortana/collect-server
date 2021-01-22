package cn.edu.njnu.controller;

import cn.edu.njnu.mapper.UserMapper;
import cn.edu.njnu.pojo.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {
    private final UserMapper userMapper;

    public UserController(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @GetMapping("/queryUserList")
    public List<User> queryUserList() {
        List<User> users = userMapper.queryUserList();
        for (User user : users) {
            System.out.println(user);
        }
        return users;
    }

    @GetMapping("/queryByNameAndPassword")
    public User queryByNameAndPassword() {
        User user = userMapper.queryByNameAndPassword("Test", "123456");
        System.out.println(user);
        return user;
    }
}
