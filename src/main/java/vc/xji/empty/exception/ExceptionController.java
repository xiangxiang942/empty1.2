package vc.xji.empty.exception;

import org.apache.shiro.authz.AuthorizationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import vc.xji.empty.util.ResponseObject;

@RestControllerAdvice
public class ExceptionController {
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(Exception.class)
    public String exception(Exception e) {
        e.printStackTrace();
        return ResponseObject.serverError("服务器异常");
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(MessageException.class)
    public String messageException(MessageException e) {
        return ResponseObject.requestError(e.getMessage());
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(AuthorizationException.class)
    public String unauthorized() {
        return ResponseObject.unauthorized("无权访问");
    }

}
