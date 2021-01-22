package cn.edu.njnu.pojo;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int userId;
    @JsonAlias("username")
    private String userName;
    @JsonAlias("password")
    private String userPwd;
    private String salt;
    @JsonAlias("email")
    private String userEmail;
}
