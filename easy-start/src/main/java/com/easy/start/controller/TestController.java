package com.easy.start.controller;


import cn.dev33.satoken.annotation.SaIgnore;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/test")
@RestController
@AllArgsConstructor
@Tag(name = "测试")
@SaIgnore
public class TestController {


}