package cn.edu.njnu;

import cn.edu.njnu.mapper.UserMapper;
import cn.edu.njnu.pojo.User;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.SQLException;

@SpringBootTest
class CollectorApplicationTests {
    @Autowired
    DataSource dataSource;

    @Autowired
    UserMapper userMapper;

    @Test
    void contextLoads() throws SQLException {
        System.out.println(dataSource.getClass());
        System.out.println(dataSource.getConnection());
    }

    @Test
    void generateSaltTest() {
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        System.out.println(salt);
        int times = 2;
        String encodedPassword = new SimpleHash("md5", "password", salt, times).toString();
        System.out.println(encodedPassword);
    }

    @Test
    void getUserTest() {
        User user = userMapper.queryUserByName("Test");
        System.out.println(user);
    }

}
