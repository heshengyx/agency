package com.house.agency.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.util.StringUtils;

import com.myself.common.utils.ImageUtil;

public class ImageTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8924034662730343766L;
	private String src; // 图片路径
	private String path; // 应用中径
	private int width; // 图片宽
	private int height; // 图片高
	private String alt; // 图片描述
	private String base; //URL
	private String clazz; //样式
	private String id; //

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}
	
	public int doEndTag() throws JspException {
		String image = "";
		try {
			image = ImageUtil.creMinImage(src, width, height, path);
			if (image == null || "".equals(image)) {
				image = src;
			}
		} catch (Exception e) {
			e.printStackTrace();
			image = src;
		}

		StringBuffer sb = new StringBuffer();
		sb.append("<img ");
		if (!StringUtils.isEmpty(clazz)) {
			sb.append("class=\"").append(clazz).append("\" ");
		}
		if (!StringUtils.isEmpty(id)) {
			sb.append("id=\"").append(id).append("\" ");
		}
		sb.append("src=\"");
		if (!StringUtils.isEmpty(base)) {
			sb.append(base);
		}
		sb.append(image).append("\" ");
		if (!StringUtils.isEmpty(alt)) {
			sb.append("alt=\"").append(alt).append("\" ");
		}
		sb.append("/>");
		JspWriter out = pageContext.getOut();
		try {
			out.print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		release();
		return (SKIP_BODY);
	}

	public void release() {
		super.release();
		src = null;
		width = 0;
		height = 0;
		path = null;
	}
}
