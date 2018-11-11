package com.etoak.util;

import java.util.List;
import java.util.Map;

public class TreeNode {
	
	private Integer id;
	private String text;
	private String state;
	private boolean checked;
	private Map<String, Object> attribute;
	private List<TreeNode> children;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public Map<String, Object> getAttribute() {
		return attribute;
	}
	public void setAttribute(Map<String, Object> attribute) {
		this.attribute = attribute;
	}
	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	
	
}
