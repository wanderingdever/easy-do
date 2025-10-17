package com.easy.tool.tree;

import java.util.ArrayList;
import java.util.List;

/**
 * 树形示例
 * </p>
 *
 * @author Matt
 */
public class TreeNodeDemo implements Parents<TreeNodeDemo> {
    private final String id;
    private final String parentId;
    private List<TreeNodeDemo> children;

    public TreeNodeDemo(String id, String parentId) {
        this.id = id;
        this.parentId = parentId;
        this.children = new ArrayList<>();
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public String getParentId() {
        return parentId;
    }

    @Override
    public List<TreeNodeDemo> getChildren() {
        return children;
    }

    @Override
    public void setChildren(List<TreeNodeDemo> children) {
        this.children = children;
    }

    public static void main(String[] args) {
        List<TreeNodeDemo> nodes = new ArrayList<>();
        // 根节点
        nodes.add(new TreeNodeDemo("1", "0"));
        nodes.add(new TreeNodeDemo("2", "1"));
        nodes.add(new TreeNodeDemo("3", "1"));
        nodes.add(new TreeNodeDemo("4", "2"));
        nodes.add(new TreeNodeDemo("5", "2"));

        TreeBuilder<TreeNodeDemo> builder = new TreeBuilder<>();
        List<TreeNodeDemo> treeNodes = builder.buildTree(nodes, "0");
    }
}