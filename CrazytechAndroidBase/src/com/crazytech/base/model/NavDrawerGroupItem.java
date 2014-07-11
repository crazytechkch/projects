package com.crazytech.base.model;

import java.util.ArrayList;
import java.util.List;

import android.support.v4.app.Fragment;
import android.content.Context;

import com.crazytech.base.HomeFragment;
import com.crazytech.base.R;

public class NavDrawerGroupItem extends NavDrawerItem{
	private List<NavDrawerChildItem> childs;
	private String title;
	private Context context;
	
	public NavDrawerGroupItem() {
		super();
		initChilds();
	}

	public NavDrawerGroupItem(Context context, String title, int icon, Fragment fragment, boolean isCounterVisible,
			String count) {
		super(title, icon, fragment, isCounterVisible, count);
		this.title=title;
		
	}

	public NavDrawerGroupItem(Context context, String title, int icon, Fragment fragment) {
		super(title, icon, fragment);
		this.title=title;
		this.context = context;
		initChilds();
	}
	
	public NavDrawerGroupItem(Context context, String title, int icon) {
		super(title, icon);
		this.title = title;
		this.context = context;
		initChilds();
	}

	private void initChilds() {
		childs = new ArrayList<NavDrawerChildItem>();
	}

	public List<NavDrawerChildItem> getChilds() {
		return childs;
	}

	public void setChilds(List<NavDrawerChildItem> childs) {
		this.childs = childs;
	}
	
}
