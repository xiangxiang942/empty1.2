package vc.xji.empty.service;

import com.baomidou.mybatisplus.extension.service.IService;
import vc.xji.empty.entity.User;

public interface UserService extends IService<User> {

    String login(String username, String password) throws Exception;

    User addUser(User user) throws Exception;
}
