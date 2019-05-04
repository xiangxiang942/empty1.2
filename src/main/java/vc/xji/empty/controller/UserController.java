package vc.xji.empty.controller;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import vc.xji.empty.entity.User;
import vc.xji.empty.exception.MessageException;
import vc.xji.empty.service.UserService;
import vc.xji.empty.util.JWTUtil;
import vc.xji.empty.util.ResponseObject;

@Slf4j
@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("login")
    public String login(@RequestBody JSONObject jsonObject) throws Exception {
        String phone = jsonObject.getString("phone");
        String password = jsonObject.getString("password");

        String token = userService.login(phone, password);

        if (StringUtils.isEmpty(token)) {
            throw new MessageException("登录失败");
        }

        return ResponseObject.success("登录成功", token);
    }

    @GetMapping("info")
    @RequiresRoles("student")
    public String studentInfo() throws Exception {
        String token = (String) SecurityUtils.getSubject().getPrincipal();

        String userId = JWTUtil.getClaim(token, "1");
        User user = userService.getById(userId);

        if (user == null) {
            throw new MessageException("用户不存在");
        }

        return ResponseObject.success("获取成功", user);
    }

    @PostMapping("add")
    @RequiresRoles("admin")
    @RequiresPermissions("addUser")
    public String addStudent(@RequestBody JSONObject jsonObject) throws Exception {
        String phone = jsonObject.getString("phone");
        String password = jsonObject.getString("password");

        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);

        user = userService.addUser(user);

        if (user == null) {
            throw new MessageException("添加失败");
        }

        return ResponseObject.success("添加成功", user);
    }
}