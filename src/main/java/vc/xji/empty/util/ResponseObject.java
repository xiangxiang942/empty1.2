package vc.xji.empty.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class ResponseObject {

    public static final int UNAUTHORIZED = -2;
    public static final int SERVER_ERROR = -1;
    public static final int REQUEST_ERROR = 0;
    public static final int REQUEST_SUCCESS = 1;

    private Integer code;
    private String message;
    private Object data;

    public ResponseObject() {
    }

    public ResponseObject(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResponseObject(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static String serverError(String message) {
        return new ResponseObject(SERVER_ERROR, message).toJSONString();
    }

    public static String requestError(String message) {
        return new ResponseObject(REQUEST_ERROR, message).toJSONString();
    }

    public static String success(String message, Object data) {
        return new ResponseObject(REQUEST_SUCCESS, message, data).toJSONString();
    }

    public static String unauthorized(String message) {
        return new ResponseObject(UNAUTHORIZED, message).toJSONString();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String toJSONString() {
        JSONObject jsonObject = new JSONObject();
        JSONObject status = new JSONObject();
        status.put("code", code);
        status.put("message", message);
        jsonObject.put("status", status);

        if (data != null) {
            jsonObject.put("data", data);
        }

        return JSON.toJSONString(jsonObject, SerializerFeature.DisableCircularReferenceDetect);
    }
}

