package vc.xji.empty.entity;

public class UserPermission {
    private Integer userId;
    private Integer permissionsId;

    public UserPermission(Integer userId, Integer permissionId) {
        this.userId = userId;
        this.permissionsId = permissionId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPermissionsId() {
        return permissionsId;
    }

    public void setPermissionsId(Integer permissionsId) {
        this.permissionsId = permissionsId;
    }

    @Override
    public String toString() {
        return "UserPermission{" +
                "userId=" + userId +
                ", permissionsId=" + permissionsId +
                '}';
    }
}
