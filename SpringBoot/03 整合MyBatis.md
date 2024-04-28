[toc]

## 1. 创建项目

勾选

1.   Spring Web
2.   MyBatis Framework
3.   MySQL Driver

## 2. 连接数据库

### 在Database中配置连接数据库

#### application.yml配置

~~~ yaml
spring:
  datasource:
    driver-class-name: com.mysql.jdbc.Driver
    url: jdbc:mysql://localhost:3306/carbon
    username: root
    password: 123456
~~~

## 3. 使用

#### pojo

自动生成pojo类: 

右键数据表->Tools->Scripted Extensions->Generate POJOs.groovy

保存到对应目录

#### Mapper

~~~ java

@Mapper
public interface UserMapper {
    @Select("select * from atestuser where id = #{id}")
    public Atestuser findUserById(long id);
}
~~~

#### Service

~~~ java
public interface UserService {
   public Atestuser findUserById(long id);
}
~~~

#### ServiceImpl

~~~ java
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Atestuser findUserById(long id) {
        return userMapper.findUserById(id);
    }
}
~~~

#### Controller

~~~ java
@RestController
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("/findUserById")
    public Atestuser findUserById(Integer id){
        return userService.findUserById(id);
    }
}
~~~

