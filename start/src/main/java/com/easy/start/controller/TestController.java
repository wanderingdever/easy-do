package com.easy.start.controller;

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
public class TestController {

}