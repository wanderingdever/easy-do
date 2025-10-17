package com.easy.start.bean.dto.sys.menu;

import com.easy.start.enums.MenuType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 菜单集合入参
 * </p>
 *
 * @author Matt
 */
@Schema(description = "菜单集合入参")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuSearchDTO {

    @Schema(description = "用户ID")
    private String userId;

    @Schema(description = "菜单名字")
    private String menuName;

    @Schema(description = "菜单类型")
    private List<MenuType> menuType;
}