package com.easy.start.api;


import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.start.annotation.ApiServer;
import com.easy.start.bean.dto.sys.api.ApiDTO;
import com.easy.start.constant.ApiConstants;
import com.easy.web.annotation.ResultWrap;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/api")
@RestController
@AllArgsConstructor
@Tag(name = "API测试")
@SaIgnore
public class ApiTestController {

    /**
     * 测试
     *
     * @return 测试结果
     */
    @ApiServer
    @ResultWrap
    @PostMapping(value = "/get", headers = ApiConstants.SIGN_KEY)
    public String hello(@RequestBody ApiDTO param) {
        return "hello world";
    }

}