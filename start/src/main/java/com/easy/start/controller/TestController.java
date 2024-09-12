package com.easy.start.controller;

import com.alibaba.fastjson2.JSONObject;
import com.easy.start.utils.LianLianPayUtils;
import com.easy.utils.lang.DateUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.dromara.hutool.core.date.DatePattern;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/test")
@RestController
@AllArgsConstructor
@Tag(name = "测试")
public class TestController {

    @GetMapping("/sign")
    @Operation(summary = "测试签名")
    public void sign() {
        Map<String, Object> map = new HashMap<>();
        map.put("timestamp", DateUtils.now(DatePattern.PURE_DATETIME_PATTERN));
        map.put("oid_partner", "402409040000024473");
        map.put("user_id", "0000002");
        String jsonString = JSONObject.toJSONString(map);
        String sign = LianLianPayUtils.signMd5withRsa(jsonString);
        boolean verify = LianLianPayUtils.verify(jsonString, sign);
        System.out.println(jsonString);
        System.out.println(sign);
        System.out.println(verify);

    }
}