package com.easy.start.controller;

import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.sys.org.OrgDTO;
import com.easy.start.bean.dto.sys.org.OrgEditDTO;
import com.easy.start.bean.entity.sys.SysOrg;
import com.easy.start.service.sys.SysOrgService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 组织管理
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/org")
@Tag(name = "组织管理")
@AllArgsConstructor
public class OrgController {

    private final SysOrgService orgService;


//    @PostMapping("/info")
//    @Operation(summary = "查询组织")
//    public OrgVO info(@RequestBody @Valid IdDTO dto) {
//        return orgService.info(dto);
//    }

    @GetMapping("/tree")
    @Operation(summary = "查询组织树")
    public List<SysOrg> tree() {
        return orgService.treeOrg();
    }

    @PostMapping("/add")
    @Operation(summary = "新增组织信息")
    public void add(@Valid @RequestBody OrgDTO dto) {
        orgService.addOrg(dto);
    }

    @PostMapping("/update")
    @Operation(summary = "更新组织信息")
    public void update(@Valid @RequestBody OrgEditDTO dto) {
        orgService.updateOrg(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除组织信息")
    public void del(@RequestBody IdDTO dto) {
        orgService.deleteOrg(dto.getId());
    }

}